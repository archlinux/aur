# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>
_pkgname=acousticbrainz-gui
pkgname=$_pkgname-git
pkgver=r21.1b839cb
pkgver(){
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc='Submit audio features to the AcousticBrainz project.'
arch=('any')
url='http://acousticbrainz.org/'
license=('GPL2')
depends=('qt4' 'qjson' 'essentia-acousticbrainz')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/MTG/${_pkgname}.git")
md5sums=('SKIP')

build() {
  cd "$_pkgname"
  cmake -DCMAKE_BUILD_TYPE=Release .
  make
  # Prepare icons
  cd images/
  rename 'acoustid-fp' 'acousticbrainz-gui' *.*
  mv acoustid-fingerprinter.svg acousticbrainz-gui.svg
}

package() {
  cd "$_pkgname"
  install -d "$pkgdir/usr/bin"
  install acousticbrainz-gui "$pkgdir/usr/bin/"
  # Install icons
  install -d "$pkgdir/usr/share/pixmaps/"
  install -t "$pkgdir/usr/share/pixmaps/" images/*
}

# vim:set ts=2 sw=2 et:
