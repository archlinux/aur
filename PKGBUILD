# Maintainer: Akatsuki Rui <akiirui@outlook.com>

_pkgname="dofi"
pkgname="dofi-manager-git"
pkgver=0.1.5.r0.g450d507
pkgrel=1
pkgdesc="A simple dotfile manager"
arch=("x86_64")
makedepends=("cargo" "git")
url="https://github.com/akiirui/dofi"
license=("MIT")
provides=("dofi-manager")
conflicts=("dofi-manager")
source=("git+https://github.com/akiirui/dofi")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
  cd "$srcdir/$_pkgname"
  RUSTUP_TOOLCHAIN=stable \
    DOFI_VERSION=$pkgver \
    cargo build --locked --release --target-dir target
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "target/release/dofi" "$pkgdir/usr/bin/dofi"
  install -Dm644 "share/completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/dofi.fish"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
