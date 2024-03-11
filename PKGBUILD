# Maintainer: Christopher <archlinux-maintainer@christopherz.com>

pkgname="proid-git"
pkgver=r11.480742a
pkgrel=1
pkgdesc="A tool to hide and show windows in X"
arch=("any")
url="https://gitlab.com/rehposuite/proid"
license=("GPL")
depends=("xdotool")
makedepends=("stack")
provides=("proid")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "proid"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "proid"

  stack setup
  stack build
}

package() {
  cd "proid"

  find ./ -path '*/dist/*' -type f -name proid -perm /u+x \
        -execdir install -Dm755 -t "$pkgdir/usr/bin/" {} \;

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
