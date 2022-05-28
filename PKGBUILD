# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Loek Le Blansch <loek@pipeframe.xyz>

pkgname=arduino-language-server-git
pkgver=0.6.0.r12.g22ca780
pkgrel=1
epoch=2
pkgdesc="An Arduino Language Server based on Clangd to Arduino code autocompletion"
arch=(x86_64 i686 i486 pentium4 arm armv6h armv7h aarch64)
url="https://github.com/arduino/arduino-language-server"
license=(Apache)
makedepends=(git go)
provides=(arduino-language-server)
conflicts=(arduino-language-server)
source=("git+https://github.com/arduino/arduino-language-server.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 arduino-language-server -t "$pkgdir"/usr/bin
}
