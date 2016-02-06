# Maintainer: Sean Behan <seanwbehan@riseup.net>

pkgname=maybe-git
_pkgname=maybe
pkgver=0.2.1
pkgrel=1
pkgdesc="Allows you to run a command and see what it does to your files"
arch=('any')
url="https://github.com/p-e-w/maybe"
license=('GPL')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-ptrace' 'python-blessings')
source=("${pkgname%-*}::git+https://github.com/p-e-w/maybe.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
    python3 setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}"
	python3 setup.py install --root=$pkgdir/ --optimize=1
}
