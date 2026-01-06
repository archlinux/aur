# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wolfssh
pkgver=1.4.22
pkgrel=1
pkgdesc="A small, fast, portable SSH implementation, including support for SCP and SFTP"
arch=('i686' 'x86_64')
url="https://www.wolfssl.com/"
license=('GPL-3.0-or-later')
depends=('glibc' 'wolfssl')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/wolfSSL/wolfssh/archive/refs/tags/v$pkgver-stable.tar.gz"
        "$pkgname-$pkgver-src.tar.gz.asc::https://github.com/wolfSSL/wolfssh/releases/download/v$pkgver-stable/wolfssh-$pkgver-stable.tar.gz.asc")
sha256sums=('a6f5cf7832d4138119edacfb4eab6c731ecc9421c9e46527ab602992d7c2ad42'
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
