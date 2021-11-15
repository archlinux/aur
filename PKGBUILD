# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=tunneler-git
_pkgname=tunneler
pkgver=r2.cd75602
pkgrel=2
pkgdesc="port of an old DOS game written using SDL"
url="https://github.com/jose1711/tunneler"
depends=('sdl')
makedepends=('git' 'gendesk')
conflicts=(tunneler)
license=('GPL')
arch=('x86_64' 'i686')
source=("${pkgname}"::'git+https://github.com/jose1711/tunneler.git')
md5sums=('SKIP')

prepare() {
  gendesk -f -n --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" --exec "tunneler" --categories "Game;ActionGame"
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${pkgname}
  aclocal
  automake --add-missing
  autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR=${pkgdir} install
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
