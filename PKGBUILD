# Maintainer: gardar <aur@gardar.net>
_pkgname='pynetbox'
pkgname=python-$_pkgname
pkgbase=$pkgname
pkgver=5.3.1
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
sha256sums=('80743328f51f28827825fb2c9cb1993175da37c88988f02075f6f50e16333e0c')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

