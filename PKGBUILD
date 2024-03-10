# Maintainer: Christopher <archlinux-maintainer@christopherz.com>

pkgname="dec-git"
pkgver=0.2.0.0
pkgrel=1
pkgdesc="A declarative package manager for Arch Linux"
arch=("x86_64")
url="https://gitlab.com/rehposuite/dec"
license=("GPL")
depends=("paru")
makedepends=("stack")
provides=("dec")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "dec"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build(){
  cd "dec"

  stack setup
  stack build
}

package() {
  cd "dec"

  find ./ -path '*/dist/*' -type f -name proid -perm /u+x \
        -execdir install -Dm755 -t "$pkgdir/usr/bin/" {} \;

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
