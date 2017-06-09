# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

_pkgname=es-shell
pkgname=${_pkgname}-jpco-git
pkgver=r67.568efda
pkgrel=1
pkgdesc="Extensible Shell, a shell based on Plan 9's rc shell (jpco's fork, GIT)"
arch=('x86_64' 'i686')
url="https://github.com/jpco/es-shell"
license=('Unknown')
#depends=('')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/jpco/${_pkgname}.git")
sha256sums=('SKIP')
install=es-shell.install

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgname}
  aclocal
  autoconf
  libtoolize -qi
  ./configure --prefix=${pkgdir}/usr --with-readline
  make
}

package() {
  cd ${_pkgname}
  #install -D -m644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  make install
}

# vim:set ts=2 sw=2 et:
