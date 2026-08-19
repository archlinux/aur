# Maintainer:  Daniel Graña <dangra at gmail dot com>

pkgname=mkinitcpio-tailscale
pkgver=2.6.0
pkgrel=1
pkgdesc="mkinitcpio hook to launch Tailscale on systemd or busybox based initramfs"
arch=("any")
url="https://github.com/dangra/mkinitcpio-tailscale"
license=("GPL-2.0-or-later")
# tailscale is needed at image build time: the install hook refuses to build
# without tailscaled present.
depends=("mkinitcpio" "tailscale")
optdepends=("openssh: host key generation for the default Tailscale SSH setup"
  "jq: node key expiry checking in setup-initcpio-tailscale --check")
install=mkinitcpio-tailscale.install
source=("initcpio-hooks-tailscale"
  "initcpio-install-tailscale"
  "setup-initcpio-tailscale"
  "libalpm-hook-tailscale"
  "libalpm-script-tailscale")
sha256sums=('00f3d983c9444de563060b8a549a5709be479aa97211646ef7b03550d876a4a4'
            '360c03957129084cd8ec978fc8caae7898aad423f6d9fcf9d32fe1f7310a6f51'
            '7030872118c5d5ea7d67c0d36a1913c94d6beb0d43100a59d892600c54f7e800'
            '2a68c473a701af5a33e538ac9b6533c1fac6e7191d093b0f8b878071f66d639f'
            '135f0c80535004166b9aa09b3e91dab433f8cc15a34e0c479a411d34448cb678')

package() {
  install -m 644 -D "${srcdir}/initcpio-hooks-tailscale" "${pkgdir}/usr/lib/initcpio/hooks/tailscale"
  install -m 644 -D "${srcdir}/initcpio-install-tailscale" "${pkgdir}/usr/lib/initcpio/install/tailscale"
  install -m 755 -D "${srcdir}/setup-initcpio-tailscale" "${pkgdir}/usr/bin/setup-initcpio-tailscale"
  install -m 644 -D "${srcdir}/libalpm-hook-tailscale" "${pkgdir}/usr/share/libalpm/hooks/mkinitcpio-tailscale.hook"
  install -m 755 -D "${srcdir}/libalpm-script-tailscale" "${pkgdir}/usr/share/libalpm/scripts/mkinitcpio-tailscale"
}
