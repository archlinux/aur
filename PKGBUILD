# Maintainer: Jeff M. Hubbard <jeffmhubbard@gmail.com>
pkgname=wmfocus-git
_pkgname=wmfocus
pkgver=r100.6fd14aa
pkgrel=2
pkgdesc="Visually focus window by label"
url="https://github.com/svenstaro/wmfocus"
arch=('x86_64')
license=('MIT')
depends=('xcb-util-keysyms' 'cairo' 'libxkbcommon-x11')
makedepends=('rust' 'python' 'git')
provides=('wmfocus')
conflicts=('wmfocus')
source=("git+https://github.com/svenstaro/wmfocus.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    cargo build --locked --release --features i3
}

package() {
    cd "$_pkgname"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm 755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
