# Contributor: mnussbaum

pkgname=rot8-git
_pkgname="rot8"
pkgver=0.1.1.7.g19c65e6
pkgrel=1
pkgdesc="A screen rotation daemon "
arch=("any")
url="https://github.com/efernau/rot8"
license=("MIT")
makedepends=("rust" "cargo")
source=("$_pkgname::git+https://github.com/efernau/rot8.git")
sha256sums=("SKIP")
provides=("rot8")
conflicts=("rot8")

pkgver() {
  cd $_pkgname
  echo -n "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

package_rot8-git() {
  cd $_pkgname
  env CARGO_INCREMENTAL=0 cargo build --release
  install -D -m755 "$srcdir/$_pkgname/target/release/rot8" "$pkgdir/usr/bin/rot8"
}

# vim:set ts=2 sw=2 et:
