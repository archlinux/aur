# Maintainer: York-Simon Johannsen <aur.archlinux.org+btrfs-heatmap-systemd@yosijo.de>
pkgname=btrfs-heatmap-systemd
pkgver=r2.da5dbeb
pkgrel=1
pkgdesc="systemd service and timer unit for btrfs-heatmap"
arch=('any')
url="https://codeberg.org/Waimanu/btrfs-heatmap-systemd/"
license=('AGPL-3.0-or-later')
depends=('btrfs-heatmap')
makedepends=('git')
source=("${pkgname}::git+https://codeberg.org/Waimanu/${pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 btrfs-heatmap-systemd.bash "${pkgdir}/usr/local/bin/btrfs-heatmap-systemd"
  install -Dm755 btrfs-heatmap@.service     "${pkgdir}/etc/systemd/system/btrfs-heatmap@.service"
  install -Dm755 btrfs-heatmap@.timer       "${pkgdir}/etc/systemd/system/btrfs-heatmap@.timer"
}
