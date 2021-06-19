pkgname="deskx-git"
_pkgname="deskx"
pkgver=r42.74a9400
pkgrel=2
pkgdesc="A very small program to remotely control a computer in a local network (X11-only). "
arch=("x86_64")
url="https://github.com/DeskX11/DeskX"
license=("apache")
makedepends=(
  "libx11"
  "libxtst"
  "openssl"
)
source=(
  "$_pkgname::git+https://github.com/DeskX11/DeskX.git"
)
sha256sums=(
  "SKIP"
)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make server client
}

package() {
  cd "$srcdir"
  install -Dm755 "$_pkgname/dxc" "$pkgdir/usr/bin/dxc"
  install -Dm755 "$_pkgname/dxs" "$pkgdir/usr/bin/dxs"
}
