# Maintainer: Fernando Vasquez <fmorataya.04@gmail.com>

_gitname=wpgtk
pkgname="${_gitname}-git"
_gitbranch=master
_gitauthor=deviantfero # deviantfero
pkgver=r194.0c490f8
pkgrel=1
pkgdesc="A gui wallpaper chooser that changes your Openbox theme, GTK theme and Tint2 theme"
url="https://github.com/${_gitauthor}/${_gitname}"
license=('BSD')
source=("git://github.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}")
sha512sums=('SKIP')
arch=('any')
depends=('python' 'python2' 'python2-pillow' 'feh' 'python-gobject' 'gtk3' 'libxslt')
makedepends=('git')
optdepends=()
conflicts=("${_gitname}" 'nitrogen')
provides=("${_gitname}")

pkgver() {
  cd "${srcdir}/${_gitname}"
  (
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${_gitname}"
  mkdir -p ${pkgdir}/usr/bin/wpgtk/py
  mkdir -p ${pkgdir}/usr/bin/wpgtk/src/gui
  mkdir -p ${pkgdir}/usr/bin/wpgtk/src/data
  install -D -m755 ./wpgtk/py/* ${pkgdir}/usr/bin/wpgtk/py
  install -D -m755 ./wpgtk/wpg.py ${pkgdir}/usr/bin/wpgtk/
  install -D -m755 ./wpgtk/gui/* ${pkgdir}/usr/bin/wpgtk/gui/
  install -D -m755 ./wpgtk/data/* ${pkgdir}/usr/bin/wpgtk/data/
  install -D -m775 ./wpcscript ${pkgdir}/usr/bin/wpcscript
  install -D -m775 ./wpg ${pkgdir}/usr/bin/wpg
  install -D -m755 ./functions ${pkgdir}/usr/bin/wpgtk/functions
  bash ./installaur.sh
  echo
  echo "Remember to add sh ~/.wallpapers/wp_init.sh"
  echo "to your startup programs"
  echo
  echo "To run just type wpg"
  echo
  sleep 3
}
