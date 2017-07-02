# Maintainer: Fernando Vasquez <fmorataya.04@gmail.com>

_gitname=wpgtk
pkgname="${_gitname}-git"
_gitbranch=testing
_gitauthor=deviantfero # deviantfero
pkgver=r247.1610c3f
pkgrel=1
pkgdesc="A gui wallpaper chooser that changes your Openbox theme, GTK theme and Tint2 theme"
url="https://github.com/${_gitauthor}/${_gitname}"
license=('MIT')
source=("git://github.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}")
sha512sums=('SKIP')
arch=('any')
depends=('python' 'python-pillow' 'feh' 'python-gobject' 'gtk3' 'libxslt')
makedepends=('git')
optdepends=()
conflicts=("${_gitname}")
provides=("${_gitname}")

pkgver() {
  cd "${srcdir}/${_gitname}"
  (
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${_gitname}"
  wget https://raw.githubusercontent.com/deviantfero/wal/master/wal
  mkdir -p ${pkgdir}/usr/bin/wpgtk/py
  mkdir -p ${pkgdir}/usr/bin/wpgtk/gui
  mkdir -p ${pkgdir}/usr/bin/wpgtk/data
  install -D -m755 ./wpgtk/wpg.py ${pkgdir}/usr/bin/wpgtk/
  install -D -m755 ./wpgtk/gui/* ${pkgdir}/usr/bin/wpgtk/gui/
  install -D -m755 ./wpgtk/data/* ${pkgdir}/usr/bin/wpgtk/data/
  install -D -m775 ./wpg ${pkgdir}/usr/bin/wpg
  install -D -m775 ./wal ${pkgdir}/usr/bin/wal
  rm ./wal
  bash ./installaur.sh
  echo
  echo "Remember to add sh ~/.wallpapers/wp_init.sh"
  echo "to your startup programs"
  echo
  echo "To run just type wpg"
  echo
  sleep 3
}
