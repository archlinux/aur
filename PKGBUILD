pkgname=paternoster
pkgver=3.1.0
pkgrel=1
pkgdesc='Allows to run ansible playbooks like ordinary python or bash scripts.'
arch=('any')
url="https://github.com/uberspace/paternoster"
license=('MIT')
makedepends=('python-setuptools')
depends=('ansible' 'python' 'python-six' 'python-tldextract>=2.0.1')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Uberspace/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('fb2c1d59a7584b98a3545b59036dc1f48be4cc4f492ce9cca694f8fc890a52cb36c97f082db7fe7f7407712833ab367bdf54a8e4c1c9d09b20594c2873c7996f')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --skip-build \
	  --optimize=1 \
	  --prefix=/usr \
	  --root="${pkgdir}"
	install -vDm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
