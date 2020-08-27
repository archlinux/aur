# $Id: PKGBUILD 148464 2015-12-05 15:21:48Z bpiotrowski $
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=silly
pkgver=0.1.0
pkgrel=9
pkgdesc="Simple Image Loading LibrarY, a part of the CEGUI project"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url="http://www.cegui.org.uk/wiki/index.php/SILLY"
license=('MIT')
depends=('libjpeg' 'libpng' 'gcc-libs')
source=("http://downloads.sourceforge.net/crayzedsgui/SILLY-$pkgver.tar.gz"
        "silly-libpng1.5.patch"
        'config.guess::http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD'
        'config.sub::http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD')
sha256sums=('afa064f70433008ec9837fb601c8d73e73db07856e4566f8bee010758c5304ac'
            '674e86ad0180ceb57e589234a80ac8ed9344357676259349da00c1d23bde264e'
            'SKIP'
            'SKIP')

prepare() {
  cd SILLY-$pkgver
  patch -Np1 -i "$srcdir/silly-libpng1.5.patch"
}

build() {
  cd SILLY-$pkgver

  cp ../config.guess .
  cp ../config.sub .

  ./configure --prefix=/usr
  make
}

package() {
  cd SILLY-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
