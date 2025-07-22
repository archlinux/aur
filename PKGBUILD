# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=chawan
pkgver=0.2.2
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
sha512sums=('c1d43b0f6634140a5ed6f7790c3907dbadfd807b81c2561dae67ef596f84e95354480e45abc20c96c12718d758c4a9f2c1a5be37a9c342f422b2fec2434eb26e')
b2sums=('f0853f6a3eeed5ff3b6feb9e33a99483f96fa653612f9dfaafb92d5afef8f8adc789eb34c4073faa26ca74a0fae03e1708f0bac8b685c634e60eb95de6adab4c')

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
