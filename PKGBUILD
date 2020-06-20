# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_pkgname=igetnonce
pkgname=$_pkgname-s0uthwest-git
pkgver=r10.6443eb5
pkgrel=2
pkgdesc="Tool for checking booted iOS device nonces - s0uthwest's fork - git version"
arch=('x86_64')
url="https://github.com/s0uthwest/$_pkgname"
license=('unknown')
depends=('libimobiledevice' 'libirecovery' 'libplist')
makedepends=('git')
provides=('igetnonce' 'igetnonce-s0uthwest')
conflicts=('igetnonce')
source=("git+$url.git"
        '0001-Fix-incorrect-language-standard.patch'
        '0002-Update-libirecovery-and-libusbmuxd-names-for-1.0.0-2.patch')
sha256sums=('SKIP'
            '4a6c57f0926c815652ed2fd15ef6f64a1e0dadd7dcbfcf01b246600d597d6fbd'
            '8c1bfb8f9ea691b834fcf987f8046f500048146d068c3f60520bf67b1f384050')

pkgver() {
  cd "$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"

  for p in "$srcdir"/*.patch; do
    patch -Np1 -i "$p"
  done
}

build() {
  cd "$_pkgname"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir/" install
}
