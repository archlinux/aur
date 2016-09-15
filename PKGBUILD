# Maintainer: Jan Hicken <jan.hicken@posteo.de>
pkgname=redtimer-git
_gitroot=fathomssen
_gitname=redtimer
pkgver=v1.1.1.r41.gf50900b
pkgrel=1
pkgdesc="RedTimer is an easy-to-use platform-independent time tracker which allows the user to track time while working on an issue"
arch=(i686 x86_64)
url="https://github.com/fathomssen/redtimer"
license=('LGPL')
depends=('hicolor-icon-theme' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-x11extras')
makedepends=('git')
source=("git+https://github.com/$_gitroot/$_gitname.git"
        "${_gitname}.desktop")
sha256sums=('SKIP'
            '3cbea017afa71e4bb21a941b01ce6e558897a974fefbdb7f8382a6bd3bf4194b')

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_gitname"
  git submodule update --init
}

build() {
  cd "$_gitname"

  qmake -r
  make
}

package() {
  install -Dm0644 "${_gitname}.desktop" "${pkgdir}/usr/share/applications/${_gitname}.desktop"

  cd "$_gitname"
  install -Dm0644 "client/icons/clock_red.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_gitname}.svg"

  install -D "client/RedTimerClient" "${pkgdir}/usr/bin/${_gitname}"
  install -D "libqtredmine/libqtredmine.so.1.0.0" "${pkgdir}/usr/lib/libqtredmine.so.1.0.0"
  ln -s "libqtredmine.so.1.0.0" "${pkgdir}/usr/lib/libqtredmine.so.1.0"
  ln -s "libqtredmine.so.1.0.0" "${pkgdir}/usr/lib/libqtredmine.so.1"
  ln -s "libqtredmine.so.1.0.0" "${pkgdir}/usr/lib/libqtredmine.so."
  install -D "libredtimer/libredtimer.so.1.0.0" "${pkgdir}/usr/lib/libredtimer.so.1.0.0"
  ln -s "libredtimer.so.1.0.0" "${pkgdir}/usr/lib/libredtimer.so.1.0"
  ln -s "libredtimer.so.1.0.0" "${pkgdir}/usr/lib/libredtimer.so.1"
  ln -s "libredtimer.so.1.0.0" "${pkgdir}/usr/lib/libredtimer.so"
}

# vim:set ts=2 sw=2 et:
