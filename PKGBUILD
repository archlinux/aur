# Maintainer: Kyriakos Toulgaridis <35013508+ktoulgaridis@users.noreply.github.com>
#
# Rendered by `scripts/package.sh render aur` (#22): it rewrites pkgver, pkgrel and the
# sha256sums lines from a release's SHA256SUMS. Edit the rest here.
pkgname=toppingctl-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Control the TOPPING E2x2 USB audio interface over HID (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/ktoulgaridis/toppingctl"
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'glibc' 'systemd-libs')
provides=('toppingctl')
conflicts=('toppingctl')
options=('!strip' '!debug')
source_x86_64=("toppingctl-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/toppingctl-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("toppingctl-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/toppingctl-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('096224f5cd04cd2e6b741be20ea99ca4122d9e8daf8f2fb5d6115d2338a51cf3')
sha256sums_aarch64=('12f53ba4966ebee0f9dddb36ea3b3da765a19c0d271af0a0c2a5a61013e63897')

package() {
  cd "toppingctl-v${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm0755 toppingctl "${pkgdir}/usr/bin/toppingctl"
  install -Dm0644 packaging/linux/70-toppingctl.rules \
    "${pkgdir}/usr/lib/udev/rules.d/70-toppingctl.rules"
  install -Dm0644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm0644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
