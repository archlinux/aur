# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wolfssh
pkgver=1.5.0
pkgrel=1
pkgdesc="A small, fast, portable SSH implementation, including support for SCP and SFTP"
arch=('i686' 'x86_64')
url="https://www.wolfssl.com/"
license=('GPL-3.0-or-later')
depends=('glibc' 'wolfssl')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/wolfSSL/wolfssh/archive/refs/tags/v$pkgver-stable.tar.gz"
        "$pkgname-$pkgver-src.tar.gz.asc::https://github.com/wolfSSL/wolfssh/releases/download/v$pkgver-stable/wolfssh-$pkgver-stable.tar.gz.asc")
sha256sums=('5d9be7a577c65b725f1f30ebf2197d7caedd2c9c0012aa113e78a3396104838f'
            'SKIP')
validpgpkeys=('A2A48E7BCB96C5BECB987314EBC80E415CA29677')  # wolfSSL <secure@wolfssl.com>


build() {
  cd "$pkgname-$pkgver-stable"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --enable-static
  make
}

check() {
  cd "$pkgname-$pkgver-stable"

  #make check
}

package() {
  cd "$pkgname-$pkgver-stable"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSING" -t "$pkgdir/usr/share/licenses/wolfssh"
}
