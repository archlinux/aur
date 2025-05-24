# Maintainer: Christopher <archlinux-maintainer@christopherz.com>

pkgname="proid-git"
pkgver=r20.95b98b7
pkgrel=1
pkgdesc="A tool to hide and show windows in X"
arch=("any")
url="https://github.com/Rehpotsirhc-z/proid"
license=("GPL-3.0-or-later")
depends=("xdotool")
makedepends=("stack")
provides=("proid")
conflicts=("proid-bin")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "proid"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "proid"

  stack setup
  stack build --copy-bins --local-bin-path=dist
}

package() {
  cd "proid"

  install -Dm755 "dist/proid" -t "$pkgdir/usr/bin/"

  install -Dm644 "LICENSES/GPL-3.0-or-later.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
