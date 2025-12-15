# Maintainer: Mattia Procopio (astro.matto)  <matto.astro at gmail dot com>
pkgname=rpicam-apps
pkgver=1.10.1
pkgrel=1
pkgdesc="This is a small suite of libcamera-based applications to drive the cameras on a Raspberry Pi platform."
arch=(aarch64)
url="https://github.com/raspberrypi/rpicam-apps"
license=(LGPLv2
         MIT
         GPLv3
         BSD2
         BSD3)
depends=(boost
         kmsxx
         libpisp
         python-pidng
         python-piexif
         python-prctl)
makedepends=(meson
             python-jinja
             python-sphinx)
source=("https://github.com/raspberrypi/rpicam-apps/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('27fd37794d49cccbb742365df060fdaa8f269c734c7dc786fad31acb934f19a1')

build() {
    cd $srcdir/rpicam-apps-$pkgver
    meson setup build -Dprefix=/usr -Dwerror=false
}

package() {
    mkdir -p $pkgdir/usr/lib/udev/rules.d/
    cd $srcdir/rpicam-apps-$pkgver
    DESTDIR="$pkgdir" ninja -C build install
    install -m 755 $srcdir/../99-raspberrypi-dmaheap.rules $pkgdir/usr/lib/udev/rules.d/
}
