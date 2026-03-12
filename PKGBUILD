# Maintainer: zzy-ac <zzy-ac@qq.com>

pkgname=listen1-electron
_pkgname=listen1
pkgver=null
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
sha256sums=('31fd195ef7ad2b1a48c9864b49467170554284774e3ce6b1f6e2cfa15cb43356')

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
