# Maintainer: Donald Carr<sirspudd at gmail dot com>

#_qmake_args="CONFIG+=debug"
_pkgname=qt-gtk-platform-plugin
pkgname=${_pkgname}-git
provides=($_pkgname)
conflicts=($_pkgname)
pkgver=20180218.def7d52
pkgrel=1
pkgdesc='GTK platform backend for Qt'
arch=('any')
url='https://github.com/CrimsonAS/gtkplatform'
license=('LGPL3')
source=("git://github.com/CrimsonAS/gtkplatform.git")
sha256sums=('SKIP')

pkgver () {
  cd "${srcdir}/gtkplatform"
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

build() {
  cd "${srcdir}/gtkplatform"
  qmake DESTDIR=$srcdir
  make
}

package() {
  local env_dir=${pkgdir}/usr/share/gdm/env.d/
  local env_file=${startdir}/qt-force-gtk-platform.env

  mkdir -p $env_dir
  cp ${env_file} ${env_dir}

  cd "${srcdir}/gtkplatform"
  INSTALL_ROOT="$pkgdir" make install
}
