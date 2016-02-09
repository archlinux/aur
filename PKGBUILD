# Maintainer: Sean Behan <seanwbehan@riseup.net>

pkgname=maybe-git
_pkgname=maybe
pkgver=0.3.0
pkgrel=1
pkgdesc="Allows you to run a command and see what it does to your files"
arch=('any')
url="https://github.com/p-e-w/maybe"
license=('GPL')
depends=('python' 'python-ptrace' 'python-blessings')
makedepends=('git' 'python-setuptools')
source=("${pkgname%-*}::git+https://github.com/p-e-w/maybe.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
    git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

build() {
	cd "${srcdir}/${_pkgname}"
    python3 setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}"
	python3 setup.py install --root=$pkgdir/ --optimize=1
}
