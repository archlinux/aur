# Maintainer: invisi101 <https://github.com/invisi101>
pkgname=fuetem-arch
pkgver=1.2.0
pkgrel=1
pkgdesc="Arch Linux system maintenance console — cleanup, health, security, monitoring"
arch=('any')
url="https://github.com/invisi101/fuetem-arch"
license=('GPL-3.0-only')
depends=('bash' 'pacman-contrib' 'bind' 'iproute2' 'coreutils' 'systemd'
         'smartmontools' 'nmap' 'lm_sensors' 'arch-audit' 'gitleaks')
optdepends=(
  'btrfs-progs: btrfs filesystem checks'
  'wl-clipboard: clipboard-based checksum detection'
  'aide: file integrity monitoring'
  'audit: auditd security event analysis'
  'trufflehog: git secret scanning'
  'yay: AUR update checking and cache cleanup'
  'chezmoi: dotfile drift detection'
  'flatpak: flatpak cleanup support'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('28c5f1b73d2eb49134a67fd59198a7253c9e1d55a2e12d8598b4ec55fc8af65e')

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 bin/fuetem "$pkgdir/usr/bin/fuetem"

  install -Dm644 lib/lib.sh "$pkgdir/usr/lib/fuetem/lib.sh"
  install -Dm644 lib/main.sh "$pkgdir/usr/lib/fuetem/main.sh"
  install -Dm755 lib/vpncheck.sh "$pkgdir/usr/lib/fuetem/vpncheck.sh"
  install -Dm755 lib/scan-secrets.sh "$pkgdir/usr/lib/fuetem/scan-secrets.sh"
  install -Dm755 lib/integrity_check.sh "$pkgdir/usr/lib/fuetem/integrity_check.sh"
  install -Dm755 lib/sysmonitor.sh "$pkgdir/usr/lib/fuetem/sysmonitor.sh"

  install -Dm644 assets/arch.png "$pkgdir/usr/share/fuetem/arch.png"
  install -Dm644 assets/fuetem.desktop "$pkgdir/usr/share/applications/fuetem.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
