# Maintainer: Edmund Lodewijks <e .lodewijks @ gmail. com>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Stefan Clarke <fm0nk3y@yahoo.co.uk>

pkgname=gnubg
pkgver=1.08.003
pkgrel=1
pkgdesc="World class backgammon application"
arch=('x86_64')
url="https://www.gnu.org/software/gnubg/"
license=('GPL-3.0-or-later')
depends=('python' 'gtkglext' 'curl')
source=(https://ftp.gnu.org/gnu/gnubg/gnubg-release-${pkgver}-sources.tar.gz{,.sig}
        $pkgname.desktop)
validpgpkeys=('39FC530C20B9B8C627E71BAC973B63D4ECB3B8BD')
sha256sums=('6f7d969b13cfff786fba90ff8cc5e5d564b97f4f0aa69afe4f3838f18c445979'
            'SKIP'
            'e9b40a2ce5e0b4f3c517913189abc138fe3377d86ca0baafa2b220c962caf7f1')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/-f/-fn/' doc/Makefile.in doc/Makefile.am
}

build() {
  cd $pkgname-$pkgver

  ./autogen.sh

  ./configure --prefix=/usr --bindir=/usr/bin --sysconfdir=/etc \
    --mandir=/usr/share/man --enable-simd=sse2

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/$pkgname.desktop \
    "$pkgdir"/usr/share/applications/$pkgname.desktop
}
