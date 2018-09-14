# Maintainer: Formed <formed@tuta.io>
pkgname=viper4linux
pkgver=1
pkgrel=8
pkgdesc="Implementation of the libviper library for modern Linux desktops. For community audio configs, check out https://github.com/L3vi47h4N/Viper4Linux-Configs"
arch=('x86_64')
url="https://github.com/L3vi47h4N/Viper4Linux"
license=('GPL')
depends=(
  'pacman>=5.1'
  'sudo'
  'git'
  'gstreamer'
)
makedepends=(
)
source=(
    "${pkgname}::git+https://github.com/L3vi47h4N/Viper4Linux.git"
    "gst-plugin-viperfx::git+https://github.com/L3vi47h4N/gst-plugin-viperfx.git"
    "viperfx_core_binary::git+https://github.com/vipersaudio/viperfx_core_binary.git"
)
sha1sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

conflicts=(
    'gst-plugin-viperfx-git'
    'libviperfx-nonfree-bin'
)

build() {
    cd "$srcdir/gst-plugin-viperfx"
    ./autogen.sh
    make
}

package() {
    mkdir -p $pkgdir/usr/lib/gstreamer-1.0/
    mkdir -p $pkgdir/usr/local/bin/
    mkdir -p $pkgdir/etc/$pkgname/

    cp $srcdir/gst-plugin-viperfx/src/.libs/libgstviperfx.so $pkgdir/usr/lib/gstreamer-1.0
    cp $srcdir/viperfx_core_binary/libviperfx_x64_linux.so $pkgdir/usr/lib/libviperfx.so

    chmod +x $pkgdir/usr/lib/libviperfx.so

    cd $srcdir/$pkgname
    cp -r viper4linux $pkgdir/etc/
    cp viper $pkgdir/usr/local/bin
}

install="${pkgname}.install"
