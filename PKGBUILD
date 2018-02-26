# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Contributor: Suat SARIALP <muhendis.suat@gmail.com>

pkgname=dev86
pkgver=0.16.21
pkgrel=2
pkgdesc="Simple C compiler to generate 8086 code"
arch=('x86_64')
url="http://v3.sk/~lkundrak/dev86/"
license=(GPL)
makedepends=('bin86')
options=('!strip' '!makeflags' 'staticlibs')
source=(http://v3.sk/~lkundrak/dev86/Dev86src-$pkgver.tar.gz
	mandir.patch)
md5sums=('6b96fe9d2d1c546842a4d1c7ef387e4c'
         '509df653dec8956faf1a40a8c544d9ce')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -p1 <"$srcdir"/mandir.patch
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make PREFIX=/usr DIST="$pkgdir"
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  mkdir -p "$pkgdir"/usr/share/man/man1
  make install-all DIST="$pkgdir"
  # remove all the stuff supplied by bin86
  rm "$pkgdir"/usr/bin/{as,ld,nm,objdump,size}86
  rm "$pkgdir"/usr/share/man/man1/{as,ld}86.1
}
