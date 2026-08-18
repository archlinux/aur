# Maintainer: a821 at mail de
# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Nick Smallbone <nick.smallbone@gmail.com>

pkgname=tofrodos
pkgver=2.1.1
pkgrel=1
arch=('x86_64')
pkgdesc="Convert ASCII files between the MS-DOS/Windows format and the UNIX format"
url="https://github.com/ChristopherHeng/tofrodos"
license=('GPL-2.0-only' 'GPL-3.0-or-later')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver-fixed.tar.gz"
        "Makefile.patch")
sha512sums=('93ec7498125327c1f8999aa12da1c749e4375c7301b8688b5abb6287ea2331c2de3c924b3b3e31b29bfefc53e708e547ba7b809ccec167d00910986c2ca0428c'
            'a6a0eb4ec31cb8a66b5146b6971254437a52d4df775749228679eb3dd0da5dbcfe472cb7a83a1a8ca30e0f6d08f06e5481148f988a4306d43837f740099de839')

prepare() {
  mv $pkgname-$pkgver{-fixed,}
  cd $pkgname-$pkgver
  patch -p1 < ../Makefile.patch
}

build() {
  make -C $pkgname-$pkgver
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
