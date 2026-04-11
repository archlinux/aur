# Maintainer: Markus <github@marang.dev>
pkgname=bootrecov
pkgver=0.1.2
pkgrel=1
pkgdesc='TUI/CLI helper to manage mirrored /boot backups and GRUB recovery entries'
arch=('x86_64' 'aarch64')
url='https://github.com/marang/bootrecov'
license=('MIT')
depends=('rclone' 'grub')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6fba126c76e6c89d7500b8f9a12e1b9e28f2a6cad9273de1e5667d5fbcef2b67')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build -trimpath -ldflags "-s -w" -o bootrecov ./cmd/bootrecov
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 bootrecov "${pkgdir}/usr/bin/bootrecov"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
