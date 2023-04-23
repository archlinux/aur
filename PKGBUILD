# Maintainer: Christopher <archlinux-maintainer@christopherz.com>

pkgname="proid"
pkgver=r9.e8913fd
pkgrel=1
pkgdesc="A tool to hide and show windows in X"
arch=("any")
url="https://gitlab.com/rehposuite/proid"
license=("GPL")
depends=("xdo")
makedepends=("stack")
provides=("$pkgname")
source=("git+${url}.git")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"

  stack setup
  stack build
}

package() {
  cd "$pkgname"

  find ./ -path '*/dist/*' -type f -name proid -perm /u+x \
        -execdir install -Dm755 -t "$pkgdir/usr/bin/" {} \;

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
