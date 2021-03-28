# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=python-cutie-git
_pkgname=cutie
pkgver=r86.836798d
pkgrel=1
pkgdesc="Command line User Tools for Input Easification"
arch=(any)
url='https://github.com/Kamik423/cutie'
license=('MIT')
depends=('python' 'python-colorama' 'python-readchar')
makedepends=('python-setuptools' 'git')
provides=('cutie')
conflicts=('cutie')
source=("${_pkgname}::git://github.com/Kamik423/cutie")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	# Get the version number.
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd "${srcdir}/${_pkgname}"

  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"

  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 license.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
