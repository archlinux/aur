# Maintainer: Donald Carr<sirspudd at gmail dot com>

#_qmake_args="CONFIG+=debug"
pkgname=qt-gtk-platform-plugin
provides=($pkgname)
conflicts=($pkgname)
pkgver=0.2.4
pkgrel=1
pkgdesc='GTK platform backend for Qt'
arch=('any')
url='https://github.com/CrimsonAS/gtkplatform'
license=('LGPL3')
source=("git://github.com/CrimsonAS/gtkplatform.git#tag=$pkgver")
sha256sums=('SKIP')

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
