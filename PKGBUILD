# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=god-git
pkgdesc="Utility for simplifying the Git usage (git)"
pkgver=1.9.r0.g1faa5de
pkgrel=1
arch=('x86_64')
url="https://github.com/orhun/god"
license=('GPL3')
makedepends=('git' 'go')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  go get -d ./...
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o "${pkgname%-git}" .
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"
}
