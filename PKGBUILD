# Maintainer: Patrick Stewart <patstew@gmail.com>
 
pkgname=bencher-cli
pkgver=0.5.0
pkgrel=1
pkgdesc="Detect and prevent performance regressions before they make it to production with continuous benchmarking"
url="https://bencher.dev"
arch=('x86_64')
license=('Apache-2.0')
options=(!lto)
makedepends=('git' 'rust')
source=('git+https://github.com/bencherdev/bencher.git#commit=1f44a33e704dcd66db75aa2d1a555301e7af1724')
md5sums=('SKIP')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" --manifest-path ${srcdir}/bencher/services/cli/Cargo.toml
}

package() {
    export RUSTUP_TOOLCHAIN=stable 
    cargo install --no-track --locked --offline --all-features --root "$pkgdir/usr/" --path ${srcdir}/bencher/services/cli
}

