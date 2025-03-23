# Maintainer: claymorwan <claymorwan@fembois.dev>

_pkgname="elisa-rpc"

pkgname=elisa-rpc-git
pkgver=r2.cc9a30c
pkgrel=1
pkgdesc="A Discord rich presence client for Elisa the music player by KDE."
arch=("x86_64")
url="https://github.com/renarin-kholin/ElisaRPC"
source=("$_pkgname::git+${url}")
sha256sums=('SKIP')
license=("MIT")
depends=("playerctl")
makedepends=("git" "cargo")
conflicts=("$_pkgname")
provides=("$_pkgname")

pkgver() {
	cd "$srcdir/$_pkgname"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  cargo fetch
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname"
  install -d "$pkgdir/usr/bin/"
  install -Dm644 "target/release/elisa_rpc" "$pkgdir/usr/bin/$_pkgname"
 	chmod +x "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
