# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=bin86
pkgver=0.16.21
pkgrel=2
pkgdesc='A complete 8086 assembler and loader'
arch=('x86_64')
license=('GPL')
url='https://v3.sk/~lkundrak/dev86/'
depends=('glibc')
source=("https://v3.sk/~lkundrak/dev86/$pkgname-$pkgver.tar.gz"
        'bin86-0.16.17-x86_64-1.patch')
sha1sums=('35a1222350adce5b6d62dd56f3477d9416c59174'
          '2c967c062fbee4e40ca1bf55feec2033e132e0a9')

prepare() {
  cd $pkgname-$pkgver

  patch -Np1 < "$srcdir/bin86-0.16.17-x86_64-1.patch"
}

build() {
  cd $pkgname-$pkgver

  make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver

  install -d "$pkgdir"/usr/{bin,share/man/man1}
  make PREFIX="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man/man1" install
}
