# Maintainer: gardar <aur@gardar.net>
_pkgname='pynetbox'
pkgname=python-$_pkgname
pkgbase=$pkgname
pkgver=5.1.0
pkgrel=1
pkgdesc="NetBox API client library"
arch=('any')
url="https://github.com/digitalocean/pynetbox"
license=('Apache')
depends=(
	'python'
	'python-requests'
	'python-six'
)
makedepends=('python-setuptools-scm')
source+=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6a00d05958c8619c3db6902ee19aa4a3285cd735ddeae7cfd61b977d995568ed')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

