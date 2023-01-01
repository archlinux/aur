# Maintainer: zzy-ac <zzy-ac@qq.com>

pkgname=listen1-electron
_pkgname=listen1
pkgver=2.27.0
pkgrel=1
pkgdesc="  One for all free music in China with electron13"
arch=("x86_64")
url="https://github.com/listen1/listen1_desktop"
license=('MIT')
depends=('electron13-bin')
provides=('listen1')
conflicts=('listen1')
source=(
  https://github.com/$_pkgname/$_pkgname\_desktop/releases/download/v$pkgver/$_pkgname\_$pkgver\_linux_amd64.deb)
sha256sums=('acbf7abc05d34f11e826a4e0b69e27b57d7462faa188a9b9cfabde57c29fa563')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  mkdir -p "${srcdir}/dpkgdir/temp"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
  mv ${srcdir}/dpkgdir/opt/Listen1/resources/app.asar ${srcdir}/dpkgdir/temp
  rm -rf ${srcdir}/dpkgdir/usr/share/doc ${srcdir}/dpkgdir/opt/Listen1/
  mv ${srcdir}/dpkgdir/temp ${srcdir}/dpkgdir/opt/Listen1/
  echo -e '#!/bin/bash \nelectron13 /opt/Listen1/app.asar' > ${srcdir}/dpkgdir/opt/Listen1/listen1
  chmod a+x ${srcdir}/dpkgdir/opt/Listen1/listen1
  mkdir ${srcdir}/dpkgdir/usr/bin
  cp ${srcdir}/dpkgdir/opt/Listen1/listen1 ${srcdir}/dpkgdir/usr/bin/listen1
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
} 
