# $Id: PKGBUILD 114490 2014-07-01 16:45:29Z spupykin $
# Maintainer: fdev31 <fdev31@gmail.com>

pkgname=visualfsm
pkgver=0.5.26
pkgrel=2
pkgdesc="A Visual Structure from Motion System"
arch=('x86_64')
url="https://github.com/anders-dc/vsfm-linux-x86_64"
license=('GPL3')
depends=('freeglut' 'devil' 'gtk2' 'glew' 'cuda')
makedepends=('make')
source=("https://github.com/anders-dc/vsfm-linux-x86_64/archive/master.zip")

md5sums=('2eaa9a98c0ddffdc06747d1f6fcbf043')

prepare() {
  cd "${srcdir}"/"vsfm-linux-x86_64-master"
  sed -i '/SiftGPU: SiftGPU.zip$/{ N; s#$#\n\tsed -i "s,usr/local/cuda,opt/cuda," SiftGPU/makefile#; }' Makefile
}

build() {
  cd "${srcdir}"/"vsfm-linux-x86_64-master"
  make clean
  make -j1
}

package() {
  cd "${srcdir}"/"vsfm-linux-x86_64-master"
  install -TDm 0755 SiftGPU/bin/libsiftgpu.so $pkgdir/usr/lib/libsiftgpu.so
  install -Tm 0755 pba/bin/libpba_no_gpu.so $pkgdir/usr/lib/libpba.so
  install -TDm 0755 SiftGPU/bin/MultiThreadSIFT $pkgdir/usr/bin/sift
  install -Tm 0755 vsfm/bin/VisualSFM $pkgdir/usr/bin/VisualSFM
}
