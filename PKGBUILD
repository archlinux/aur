# Maintainer:  Daniel Graña <dangra at gmail dot com>

pkgname=mkinitcpio-tailscale
pkgver=2.3.0
pkgrel=1
pkgdesc="mkinitcpio hook to launch Tailscale on systemd or busybox based initramfs"
arch=("any")
url="https://github.com/dangra/mkinitcpio-tailscale"
license=("GPL-2.0-or-later")
# tailscale is needed at image build time: the install hook refuses to build
# without the package installed.
depends=("mkinitcpio" "tailscale")
optdepends=("openssh: host key generation for the default Tailscale SSH setup"
  "jq: node key expiry checking in setup-initcpio-tailscale --check")
install=mkinitcpio-tailscale.install
source=("initcpio-hooks-tailscale"
  "initcpio-install-tailscale"
  "setup-initcpio-tailscale"
  "libalpm-hook-tailscale"
  "libalpm-script-tailscale")
sha256sums=('2f4134503e86c586ef4b1114163c4c830eb0744b853c2229736b77e18f0bf86d'
            '8da8517f58145bec941bd45cd8d38982e395b5fd316cb9c3c98908f8d544b2dd'
            '0b91128d1db2acbca70f111e013f500780c47358071c3007fa12e91021477ff7'
            '2a68c473a701af5a33e538ac9b6533c1fac6e7191d093b0f8b878071f66d639f'
            '394d750bdb5c5e8817bdc7698551e515069bee8c44f69fd4baebf934b49ba7ad')

package() {
  install -m 644 -D "${srcdir}/initcpio-hooks-tailscale" "${pkgdir}/usr/lib/initcpio/hooks/tailscale"
  install -m 644 -D "${srcdir}/initcpio-install-tailscale" "${pkgdir}/usr/lib/initcpio/install/tailscale"
  install -m 755 -D "${srcdir}/setup-initcpio-tailscale" "${pkgdir}/usr/bin/setup-initcpio-tailscale"
  install -m 644 -D "${srcdir}/libalpm-hook-tailscale" "${pkgdir}/usr/share/libalpm/hooks/mkinitcpio-tailscale.hook"
  install -m 755 -D "${srcdir}/libalpm-script-tailscale" "${pkgdir}/usr/share/libalpm/scripts/mkinitcpio-tailscale"
}
