# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>

pkgname=luvcview
pkgver=0.2.6
pkgrel=3
epoch=1
pkgdesc='Viewer for usb-uvc-cameras'
arch=('i686' 'x86_64')
url='http://www.quickcamteam.net/software/linux/v4l2-software/luvcview/'
license=('GPL')
depends=('sdl' 'v4l-utils')
source=("http://ftp.debian.org/debian/pool/main/l/$pkgname/${pkgname}_$pkgver.orig.tar.gz"
        'uvcvideo.h'
        '03-libv4l-fix.patch'
        'dynctrl-logitech.h'
        'http://patch-tracker.debian.org/patch/series/dl/luvcview/1:0.2.6-5/02-v4l2.patch'
        'http://patch-tracker.debian.org/patch/series/dl/luvcview/1:0.2.6-5/03-libv4l.patch')
sha256sums=('73c37160efaf62b896009d5686e7b21e37c1860a75e0454e8e5dbdded8a4e2d0'
            '13dae5a8aca572c52bbb22f41c48dc486090e0c51b228b368d47f3a7d589c43a'
            '57a42405e96be49c3c06a18b8f7edb5cfe146bdac7c4e315842adc953d56aece'
            '2fefabb4e534ebde5a3e96722ba9cede1c311d78c63e74d403540bcd47380882'
            'd50305901ed23dae324f9e1a44ae299717a4df28ac1a324003bac96476606947'
            '63f744488b93e08fbae4dcfa01f58515355d07998b85a0a5709b2a4da536e29b')

build() {
  cd "$srcdir"

  cp uvcvideo.h dynctrl-logitech.h "$srcdir/$pkgname-$pkgver"
  patch --follow-symlinks -p1 -i 03-libv4l-fix.patch

  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 -i ../02-v4l2.patch
  patch -p1 -i ../03-libv4l.patch

  msg "Starting make..."
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  make BIN="$pkgdir/usr/bin" install
}

# vim:set ts=2 sw=2 et:
