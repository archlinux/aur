# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=chawan
pkgver=0.2.0
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
sha512sums=('717e67953192b4f17b78a496dc1a1b50e6dca098772797b4c456492be607540099b20de61983b9620c09cb5a718d2898d7fea6135672361dba3a4326344e5c4c')
b2sums=('5a121145f54b56ed9615c4db87f94f8cf96a4d6386396f69b08e65fdb7f8d08a75a03bf2a504d84140a66688740da9d42919fb2c8083cc5680ea9da9a5e1e009')

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
