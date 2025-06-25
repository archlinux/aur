# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=chawan
pkgver=0.2.1
pkgrel=1
pkgdesc="Web browser for your terminal"
arch=(i686 x86_64)
url="https://git.sr.ht/~bptato/$pkgname"
license=(Unlicense)
depends=(
  brotli
  gcc-libs
  glibc
  libssh2
  openssl
  sh
)
makedepends=(
  "nim>=2.0.0"
)
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6c584abffd71e8d5ac249261665f591d2dbfa6fc45cc324b7308cc1205ce547c1e1b32bd94bd2f7ca815ba89dd37ebb202c969173ca4844fa16da7b5efc2c62c')
b2sums=('808d0d0e64f5247a3d90a565b08f04c81e0af486f9c8d4d6c15a26cbfb72ec9975b60fb1c48dd2181c54e2e7b553489d9275239478f3e3bf8a1650b71d8c1c5e')

build() {
  cd $pkgname-v$pkgver
  export CFLAGS+=" -ffile-prefix-map=$srcdir/="
  if [[ $CARCH == "i686" ]]; then
    export CFLAGS+=" -fpermissive"
  fi
  make LIBEXECDIR=/usr/lib/$pkgname
}

package() {
  cd $pkgname-v$pkgver
  install -vDm 644 UNLICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  make DESTDIR="$pkgdir" PREFIX="/usr" LIBEXECDIR="$pkgdir"/usr/lib/$pkgname install
}
