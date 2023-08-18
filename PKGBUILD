# Maintainer: Daniel Ramirez Chiquillo <hi@danielrachi.com>
pkgname=trin-git
pkgver=r996.7ab829a
pkgrel=1
epoch=
pkgdesc="An Ethereum portal client [pre-release]"
arch=('x86_64')
url="https://github.com/ethereum/trin"
license=('unknown')
groups=()
depends=('glibc' 'gcc-libs')
makedepends=('git' 'gcc' 'rust' 'openssl' 'clang' 'pkg-config' 'base-devel' 'llvm' )
checkdepends=()
optdepends=()
provides=(trin)
conflicts=(trin)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd trin
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd trin

    export RUSTUP_TOOLCHAIN=stable
    cargo build --workspace --release
}

package() {
  cd trin

  install -Dm755 "target/release/trin" "$pkgdir/usr/bin/trin"
}

