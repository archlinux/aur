# Maintainer: pacmanics

pkgname=aur-security-auditor
pkgver=1.4.8
pkgrel=1
pkgdesc="Explainable security auditor for AUR packages and supply-chain risks"
arch=('any')
url="https://github.com/pacmanics/aur-security-auditor"
license=('GPL-3.0-or-later')

depends=(
  'python'
  'pacman'
  'binutils'
  'libcap'
  'sudo'
  'hicolor-icon-theme'
)

optdepends=(
  'xdg-utils: automatically open the local dashboard in a browser'
  'git: inspect recent AUR Git history'
  'devtools: build packages in an isolated clean chroot for deep scans'
  'namcap: inspect package quality during deep scans'
  'libarchive: inspect built package archives with bsdtar'
  'zstd: inspect local .tar.zst package source archives'
)


source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/pacmanics/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=('0eae8e8b2a265dd3d828ddd9c5803157e3004a85b6db570bc779534b66710064')

package() {
  local root="$srcdir/$pkgname-$pkgver"

  install -Dm755 "$root/src/aur-security-auditor" "$pkgdir/usr/bin/aur-security-auditor"
  install -Dm755 "$root/src/aur-security-auditor-launcher" "$pkgdir/usr/bin/aur-security-auditor-launcher"
  install -Dm644 "$root/src/core.py" "$pkgdir/usr/lib/aur-security-auditor/core.py"
  install -Dm644 "$root/data/dashboard.html" "$pkgdir/usr/share/aur-security-auditor/dashboard.html"
  install -Dm644 "$root/data/atomic-arch-packages.txt" "$pkgdir/usr/share/aur-security-auditor/atomic-arch-packages.txt"
  install -Dm644 "$root/data/iocs.json" "$pkgdir/usr/share/aur-security-auditor/iocs.json"
  install -Dm644 "$root/data/aur-security-auditor.svg" "$pkgdir/usr/share/aur-security-auditor/aur-security-auditor.svg"
  install -Dm644 "$root/data/aur-security-auditor.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/aur-security-auditor.svg"
  install -Dm644 "$root/aur-security-auditor.desktop" "$pkgdir/usr/share/applications/aur-security-auditor.desktop"
  install -Dm644 "$root/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
