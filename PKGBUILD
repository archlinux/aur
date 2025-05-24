# Maintainer: Christopher <archlinux-maintainer@christopherz.com>

pkgname="dec-git"
pkgver=0.2.2.0
pkgrel=2
pkgdesc="A declarative package manager for Arch Linux"
arch=("x86_64")
url="https://github.com/Rehpotsirhc-z/dec"
license=("GPL-3.0-or-later")
depends=("paru")
makedepends=("stack")
provides=("dec")
conflicts=("dec-bin")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "dec"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "dec"
  stack setup
  stack build --copy-bins --local-bin-path=dist
}

package() {
  cd "dec"

  install -Dm755 "dist/dec" -t "$pkgdir/usr/bin/"

  install -Dm644 "LICENSES/GPL-3.0-or-later.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
