# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wolfssh
pkgver=1.4.8
pkgrel=2
pkgdesc="A small, fast, portable SSH implementation, including support for SCP and SFTP"
arch=('i686' 'x86_64')
url="https://www.wolfssl.com/"
license=('GPL' 'custom')
depends=('glibc' 'wolfssl')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/wolfSSL/wolfssh/archive/refs/tags/v$pkgver-stable.tar.gz"
        "$pkgname-$pkgver-src.tar.gz.asc::https://github.com/wolfSSL/wolfssh/releases/download/v$pkgver-stable/wolfssh-$pkgver-stable.tar.gz.asc")
sha256sums=('8727e1bc13136d4dd4bf27618e770295a37eeb36408fa488122c4e4c1361bc44'
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

  make check
}

package() {
  cd "$pkgname-$pkgver-stable"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSING" -t "$pkgdir/usr/share/licenses/wolfssh"
}
