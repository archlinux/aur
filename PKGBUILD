pkgname=hyprclock-git
pkgver=0.1.0a.23.g3fd6a91
pkgrel=1
pkgdesc="Git release of Hyprclock, a clock utility made for the Hyprland window manager."
arch=('x86_64')
url="https://github.com/cvusmo/hyprclock"
license=('GPL-3.0-only')

depends=('gtk4' 'gstreamer' 'gst-plugins-base')
makedepends=('cargo' 'git')

provides=('hyprclock')
conflicts=('hyprclock' 'hyprclock-bin' 'hyprclock-debug' 'hyprclock-bin-debug')

source=("git+https://github.com/cvusmo/hyprclock.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/hyprclock"

  git describe --long --tags --abbrev=7 --dirty --always \
    | sed 's/^v//' \
    | sed 's/-/./g'
}

build() {
  cd "$srcdir/hyprclock"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/hyprclock/target/release/hyprclock" "$pkgdir/usr/bin/hyprclock"
}
