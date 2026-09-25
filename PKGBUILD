# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bsdutils
pkgver=14.3
pkgrel=1
pkgdesc="Alternative to GNU coreutils using software from FreeBSD"
arch=('i686' 'x86_64')
url="https://codeberg.org/dcantrell/bsdutils"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc' 'libstdc++' 'libedit' 'libxo' 'ncurses' 'openssl')
makedepends=('byacc' 'meson')
source=("$pkgname-$pkgver-src.tar.gz::https://codeberg.org/dcantrell/bsdutils/archive/v${pkgver}.tar.gz")
sha256sums=('047d7907fcf52deb0981169180d18c80e600918ecbb3bc84718bf63500b20550')


build() {
  cd "bsdutils"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    -Ddefault_library="both" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "bsdutils"

  #meson test -C "_build"
}

package() {
  cd "bsdutils"

  meson install -C "_build" --destdir "$pkgdir"

  install -dm755 "$pkgdir/opt/bsdutils"
  mv "$pkgdir/usr/"{bin,share/{man,misc}} "$pkgdir/opt/bsdutils"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/bsdutils"
}
