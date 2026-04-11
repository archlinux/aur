# Maintainer: Markus <github@marang.dev>
pkgname=bootrecov
pkgver=0.1.1
pkgrel=1
pkgdesc='TUI/CLI helper to manage mirrored /boot backups and GRUB recovery entries'
arch=('x86_64' 'aarch64')
url='https://github.com/marang/bootrecov'
license=('MIT')
depends=('rclone' 'grub')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0108faf0e69d374788c1d8dee106d37d454d4c6047e26daef515c9bb8bd12055')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build -trimpath -ldflags "-s -w" -o bootrecov ./cmd/bootrecov
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 bootrecov "${pkgdir}/usr/bin/bootrecov"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
