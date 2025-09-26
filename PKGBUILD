# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bsdutils
pkgver=13.2
pkgrel=2
pkgdesc="Alternative to GNU coreutils using software from FreeBSD"
arch=('i686' 'x86_64')
url="https://codeberg.org/dcantrell/bsdutils"
license=('BSD-3-Clause')
depends=('gcc-libs' 'glibc' 'libedit' 'libxo' 'ncurses' 'openssl')
makedepends=('byacc' 'meson')
source=("$pkgname-$pkgver-src.tar.gz::https://codeberg.org/dcantrell/bsdutils/archive/v${pkgver}.tar.gz")
sha256sums=('4547990309afe686c6f36c2a4f7ac5806e0064b182dd1f93f52dda7661979a3c')


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
