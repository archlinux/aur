# Maintainer: izzqz <v@izzqz.me>
pkgname=dam-river-git
pkgver=r50.be43694
pkgrel=1
pkgdesc="Itsy-bitsy dwm-esque bar for river"
arch=('i686' 'x86_64')
url="https://codeberg.org/sewn/dam"
license=("MIT")
provides=("dam")
makedepends=(
  'wayland'
  'wayland-protocols'
  'fcft'
  'pixman'
  'pkg-config'
)
optdepends=()
depends=()
conflicts=('dam')
source=("$pkgname::git+https://codeberg.org/sewn/dam.git")
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  if [ -e "$BUILDDIR/config.h" ]; then
    cp "$BUILDDIR/config.h" "$srcdir"/"$pkgname"
  fi
}

build() {
  cd "$pkgname"
  make
}

# check() {}

package() {
  cd "$pkgname"

  install -Dm755 "dam" "$pkgdir/usr/bin/dam"
}
