# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>
_pkgname=acousticbrainz-gui
pkgname=$_pkgname-git
pkgver=r43.708e2de
pkgver(){
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc='Submit audio features to the AcousticBrainz project.'
arch=('any')
url='http://acousticbrainz.org/'
license=('GPL2')
depends=('qt5-base' 'essentia-acousticbrainz')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/MTG/${_pkgname}.git")
md5sums=('SKIP')

build() {
  cd "$_pkgname"
  cmake -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "$_pkgname"

  msg2 'Install acousticbrainz-gui binary.'
  install -D acousticbrainz-gui "$pkgdir/usr/bin/acousticbrainz-gui"

  msg2 'Install desktop file.'
  install -D "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"

  msg2 'Install icons.'
  install -d "$pkgdir/usr/share/pixmaps/"
  install -t "$pkgdir/usr/share/pixmaps/" images/*
}

# vim:set ts=2 sw=2 et:
