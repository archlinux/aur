# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=python-pqdm
_name=pqdm
pkgver=0.2.0
pkgrel=1
pkgdesc="Comfortable parallel TQDM using concurrent.futures"
arch=('any')
url='https://github.com/niedakh/pqdm'
license=('MIT')
depends=('python' 'python-bounded-pool-executor' 'python-tqdm' 'python-typing-extensions')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	"https://raw.githubusercontent.com/niedakh/pqdm/master/LICENSE")
sha256sums=('d99d01fe498d327b440ebfe08c14c84e0dc9ecce6172ef9a31f96bb1aaf4e9e3'
	'26eb7ffd30fbb27cc167fea075b88087c6fa661b9469da1de8b2d4d1aba96f79')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}"
	install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "${_name}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
