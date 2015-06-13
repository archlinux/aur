# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

# Contributor: der_FeniX <derfenix at derfenix dot com>
# Contributor: Thorsten Töpper <atsutane at freethoughts dot de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: red_over_blue, Abaddon <kukububu@go2.pl>
# Contributor: damir <damir@archlinux.org>

pkgname=xvidcap
pkgver=1.1.7
pkgrel=7
pkgdesc="A small tool to capture things going on on an X-Windows display to either individual frames or an MPEG video"
arch=('i686' 'x86_64')
license=('GPL')
url="http://xvidcap.sourceforge.net/"
depends=('dbus-glib' 'lame' 'libxmu' 'libglade' 'ffmpeg')
makedepends=('rarian')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        "xextproto-7.1.1.patch"
        "xvidcap-ffmpeg.patch"
        "neomorphs.patch"
        "ffmpeg-0.8.patch")
md5sums=('b39a682d3ef9fcbf424af771936780e2'
         'fbde2b076c5ea05723883b87f3ef2a65'
         'f18817da1c0dada05fa791ae53193b2c'
         '73533c0dd38c4d4de748417e6b6c7b38'
         '6e4dfab56b877362757092f55ad6b337')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  patch -Np1 -i $srcdir/xextproto-7.1.1.patch
  patch -Np0 -i $srcdir/xvidcap-ffmpeg.patch
  patch -Np1 -i $srcdir/ffmpeg-0.8.patch
  patch -Np1 -i $srcdir/neomorphs.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr \
              --with-x \
              --with-gtk2 \
              --enable-libmp3lame \
              --without-forced-embedded-ffmpeg

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make prefix=$pkgdir/usr install
}
