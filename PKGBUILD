# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=pacman-repo-stats
pkgver=0.5.0
pkgrel=1
pkgdesc="Show usage statistics of repositories in pacman.conf"
arch=('x86_64')
url="https://github.com/bpetlert/pacman-repo-stats"
license=('GPL-3.0-or-later')
depends=(libalpm.so)
makedepends=(cargo)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('79efe3c7c4ff7a3b07a76f465d02671e18a0b59759918bdd9df64ecc39df5e8071d2a1a0e7e06124d58add906e90f0665d077d6aebfe90de760bc1dd380774d5')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build  --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/pacman-repo-stats" "$pkgdir/usr/bin/pacman-repo-stats"

  install -Dm644 "README.adoc" "$pkgdir/usr/share/doc/${pkgname}/README.adoc"
}
