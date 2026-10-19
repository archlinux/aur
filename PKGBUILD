# Maintainer: Aaron Roque Fonseca <https://github.com/aaronroquefonseca>
# TEMPLATE for AUR `linux-trackpad-driver-bin` (prebuilt stable binaries).
#
# DO NOT publish this file directly. Placeholders 0.1.2 / 46d0507de93975c09ef6b0db9d59af1151f747116bd0ef94b292067809fbac37 /
# 5746977c78574b7f2b14cd80082b1f6e85ffe7c518448c9bfc892ef2b9c8f205 are filled by packaging/arch/render-aur.sh once tag vX.Y.Z
# exists and both per-arch release tarball digests are known. Each arch uses
# its own release asset; publishing SKIP for immutable release archives is
# forbidden. See packaging/arch/README.md for the contract.

pkgname=linux-trackpad-driver-bin
pkgver=0.1.2
pkgrel=2
pkgdesc="Extensible userspace Linux driver for enhanced trackpad functionality, currently supporting Apple Magic Trackpad 2 — prebuilt binary"
arch=('x86_64' 'aarch64')
url="https://github.com/aaronroquefonseca/linux-trackpad-driver"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc' 'systemd')
optdepends=('libinput: pointer/palm processing for passthrough events and hwdb quirks (see INSTALL.md "hwdb note")')
provides=('linux-trackpad-driver')
conflicts=('linux-trackpad-driver' 'linux-trackpad-driver-git')
backup=('etc/linux-trackpad-driver/config.toml')
install=ltd.install
source_x86_64=("https://github.com/aaronroquefonseca/linux-trackpad-driver/releases/download/v$pkgver/linux-trackpad-driver-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/aaronroquefonseca/linux-trackpad-driver/releases/download/v$pkgver/linux-trackpad-driver-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('46d0507de93975c09ef6b0db9d59af1151f747116bd0ef94b292067809fbac37')
sha256sums_aarch64=('5746977c78574b7f2b14cd80082b1f6e85ffe7c518448c9bfc892ef2b9c8f205')

package() {
  cd "linux-trackpad-driver-v${pkgver}-${CARCH}-unknown-linux-gnu"

  install -Dm755 "ltd" "${pkgdir}/usr/bin/ltd"
  install -Dm644 "config/default.toml" "${pkgdir}/etc/linux-trackpad-driver/config.toml"
  install -Dm644 "udev/99-linux-trackpad-driver.rules" "${pkgdir}/usr/lib/udev/rules.d/99-linux-trackpad-driver.rules"
  install -Dm644 "systemd/linux-trackpad-driver.service" "${pkgdir}/usr/lib/systemd/system/linux-trackpad-driver.service"
  install -Dm644 "systemd/linux-trackpad-driver-reconnect@.service" "${pkgdir}/usr/lib/systemd/system/linux-trackpad-driver-reconnect@.service"
  install -Dm644 "systemd/linux-trackpad-driver-resume.service" "${pkgdir}/usr/lib/systemd/system/linux-trackpad-driver-resume.service"
  install -Dm755 "systemd/system-sleep/ltd-resume" "${pkgdir}/usr/lib/systemd/system-sleep/ltd-resume"
  install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
