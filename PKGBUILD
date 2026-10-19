# Maintainer: Aaron Roque Fonseca <https://github.com/aaronroquefonseca>
# TEMPLATE for AUR `linux-trackpad-driver-bin` (prebuilt stable binaries).
#
# DO NOT publish this file directly. Placeholders 0.1.1 / f9f56a899ed9af92764bb837ce02caa636d9cdca8221a46ec5c4673798b6503a /
# 46cda7ac0a3143e489ad2572d122d87f78748940d4653cfd3071169a141a3039 are filled by packaging/arch/render-aur.sh once tag vX.Y.Z
# exists and both per-arch release tarball digests are known. Each arch uses
# its own release asset; publishing SKIP for immutable release archives is
# forbidden. See packaging/arch/README.md for the contract.

pkgname=linux-trackpad-driver-bin
pkgver=0.1.1
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
sha256sums_x86_64=('f9f56a899ed9af92764bb837ce02caa636d9cdca8221a46ec5c4673798b6503a')
sha256sums_aarch64=('46cda7ac0a3143e489ad2572d122d87f78748940d4653cfd3071169a141a3039')

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
