# Maintainer: snit <snit@cock.li>
# Original PKGBUILD Author: Michel Blanc <mb@mbnet.fr>

_pkgname=clac
pkgname=${_pkgname}-git
pkgver=0.3.4.r0.g311e9b2
pkgrel=1
pkgdesc='A command line, stack-based calculator with postfix notation'
url='https://github.com/soveran/clac'
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('git')

conflicts=("clac")
provides=("clac")

source=("clac::git+https://github.com/soveran/clac")
sha1sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  make
}

package() {
  cd "${_pkgname}"
  manprefix="${pkgdir}/usr/share/man"
  mkdir -p "${manprefix}/man1"
  echo Created ${manprefix}/man1
  make MANPREFIX="${manprefix}" PREFIX="${pkgdir}/usr" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
