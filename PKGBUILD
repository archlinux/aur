# PKGBUILD forked from https://aur.archlinux.org/packages/cargo-shear by:
# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
_pkgname=cargo-shear
pkgname=cargo-shear-git
pkgver=1.14.0.r10.gc33ee7b
pkgrel=1
pkgdesc="Remove unused dependencies in a Rust project"
arch=('x86_64')
url="https://github.com/Boshen/cargo-shear"
license=('MIT')
depends=('cargo')
source=("git+$url")
provides=("$_pkgname")
conflicts=("$_pkgname")
b2sums=('SKIP')

pkgver() {
  git -C $_pkgname describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cargo build --release
}

check() {
  cd "$_pkgname"
  cargo test --release -- --skip expand_cfg_test_dev_dep_via_macro
}

package() {
  cd "$_pkgname"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
