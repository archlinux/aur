# Maintainer: ErnyTech <erny.castell[at]gmail[dot]com>
pkgname=mcpelauncher-git
pkgver=551e58d
pkgrel=1
pkgdesc="Launch MCPE on Linux!"
url="https://github.com/MCMrARM/mcpelauncher-linux"
arch=('x86_64')
license=('BSD 2-clause + Other')
depends=('lib32-glibc' 'lib32-gcc-libs' 'lib32-libstdc++5' 'lib32-gtk2' 'lib32-gtkglext' 'lib32-alsa-lib' 'lib32-alsa-plugins' 'lib32-nss' 'lib32-libxss' 'lib32-gconf' 'lib32-libxtst' 'lib32-libudev0' 'lib32-libprotobuf')
makedepends=('cmake' 'lib32-zlib' 'lib32-libx11' 'lib32-libzip' 'lib32-libpng' 'lib32-util-linux' 'lib32-curl' 'lib32-openssl' 'lib32-mesa' 'protobuf')
source=('git+https://github.com/MCMrARM/mcpelauncher-linux.git'
        "https://gist.github.com/ErnyTech/986d289e504dab636e594f716396ba06/raw/d74ab4edba7d5d1651c404fa1da40495b2f8f283/mcpelauncher-git.sh")
md5sums=('SKIP' 'SKIP')
prepare() {
   cd $srcdir/mcpelauncher-linux
   git submodule update --init --recursive
   ./setup_cef.sh
   ./download_icon.sh
   ./setup_bin_libs.sh
}

build() {
  cd $srcdir/mcpelauncher-linux
  cmake .
  make
}

package() {
  install -Ddm655 $srcdir/mcpelauncher-linux/libs/ $pkgdir/opt/$pkgname/libs
  cp -R $srcdir/mcpelauncher-linux/libs/* $pkgdir/opt/$pkgname/libs
  chmod -R 655 $pkgdir/opt/$pkgname/libs
  install -Dm655 $srcdir/mcpelauncher-linux/mcpelauncher-icon.png $pkgdir/opt/$pkgname
  install -Dm755 $srcdir/mcpelauncher-linux/mcpelauncher $pkgdir/opt/$pkgname
  install -Dm755 $srcdir/$pkgname.sh $pkgdir/usr/bin/mcpelauncher
  ln -s /opt/$pkgname/libs/cef/bin/icudtl.dat  $pkgdir/opt/$pkgname
  ln -s /opt/$pkgname/libs/cef/lib/libcef.so $pkgdir/opt/$pkgname
  ln -s /opt/$pkgname/libs/cef/bin/natives_blob.bin $pkgdir/opt/$pkgname
  ln -s /opt/$pkgname/libs/cef/bin/snapshot_blob.bin $pkgdir/opt/$pkgname 
  install -Ddm655 $srcdir/mcpelauncher-linux/src/initial_setup_resources $pkgdir/opt/$pkgname/src/initial_setup_resources
  cp -R $srcdir/mcpelauncher-linux/src/initial_setup_resources/* $pkgdir/opt/$pkgname/src/initial_setup_resources
  chmod -R 655 $pkgdir/opt/$pkgname/src/initial_setup_resources
  install -Ddm655 $srcdir/mcpelauncher-linux/gplay_api $pkgdir/opt/$pkgname/gplay_api
  cp -R $srcdir/mcpelauncher-linux/gplay_api/* $pkgdir/opt/$pkgname/gplay_api
  chmod -R 655 $pkgdir/opt/$pkgname/gplay_api
}


