# Maintainer: Akatsuki Rui <akiirui@outlook.com>

_pkgname="dofi"
pkgname="dofi-manager-git"
pkgver=0.1.0.r0.g844cab5
pkgrel=1
pkgdesc="A simple dotfile manager"
arch=("x86_64")
depends=("diffutils")
makedepends=("cargo" "git")
url="https://github.com/akiirui/dofi"
license=("MIT")
source=("git+https://github.com/akiirui/dofi")
b2sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

build () {
  cd "$srcdir/$_pkgname"
  cargo build --locked --release --target-dir target
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 target/release/dofi "$pkgdir/usr/bin/dofi"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
