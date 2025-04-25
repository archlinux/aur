pkgname=netcalc-git
pkgver=r318.6d6ea88
pkgrel=1
pkgdesc="GTK-based network calculator written in C (development version)"
arch=('x86_64')
url="https://github.com/radlesner/netcalc"
license=('GPL-2.0')
depends=('gtk3' 'adobe-source-code-pro-fonts')
makedepends=('cmake' 'git' 'pkgconf')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "$pkgname" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/local
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
