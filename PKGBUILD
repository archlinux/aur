# Maintainer: devnullvoid <devnullvoid.space@gmail.com>
pkgname=cftui-git
pkgver=0.2.0
pkgrel=1
pkgdesc="A terminal user interface (TUI) for managing Cloudflare DNS records (git version)"
arch=("x86_64" "aarch64")
url="https://github.com/devnullvoid/cloudflare-tui"
license=("MIT")
depends=("glibc")
makedepends=("go")
provides=("cftui")
conflicts=("cftui" "cftui-bin")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
  cd "${pkgname%-git}"
  export CGO_ENABLED=0
  go build -o cftui ./cmd/cftui
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "cftui" "${pkgdir}/usr/bin/cftui"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/cftui/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/cftui/README.md"
}
