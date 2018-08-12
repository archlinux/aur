# Maintainer: Charlotte Van Petegem <charlotte at vanpetegem dot me>
# Maintainer: jpate <jkpate@jkpate.net>
pkgname=praat
pkgver=6.0.41
pkgrel=1
pkgdesc="A tool for 'Doing Phonetics by computer'"
arch=('x86_64')
url="http://www.fon.hum.uva.nl/praat/"
license=('GPL')
depends=( 'alsa-lib' 'gtk2' )
makedepends=('pkg-config' 'gtk2' 'alsa-lib')
optdepends=( 'ttf-sil-fonts' )

source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz" "exception.patch")

md5sums=('7c360a7748f87824ec1faf380f7d8313'
         '29b515b7c6ef133c8fd26fc3c049bbb8')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i ../exception.patch
  cp "makefiles/makefile.defs.linux.pulse" "makefile.defs"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  install -Dm755  "$srcdir/$pkgname-$pkgver/praat" "$pkgdir/usr/bin/praat"
}
