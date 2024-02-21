# Maintainer: crolbar <crolbar@crolbar.com>
_pkgname="matm"
pkgname="matm-git"
pkgver=latest_commit
pkgrel=1
pkgdesc="A tool to watch anime, movies, tv shows and read manga from the comfort of the cli!"
arch=('x86_64')
url="https://github.com/crolbar/matm"
license=('GPL3')
depends=('mpv' 'zathura-cb')
makedepends=(git cargo)
provides=('matm')
conflicts=('matm-bin')
optdepends=('vlc: an alternative video player for movies')
source=("git+$url")
options=(!lto)
md5sums=('SKIP')
prepare() {
    cd "${srcdir}/${_pkgname}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release 
}

package() {
  cd "${_pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
}
