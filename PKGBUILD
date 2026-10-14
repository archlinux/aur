# Maintainer:  Daniel Graña <dangra at gmail dot com>

pkgname=mkinitcpio-tailscale
pkgver=2.10.1
pkgrel=1
pkgdesc="mkinitcpio hook to launch Tailscale on systemd or busybox based initramfs"
arch=("any")
url="https://github.com/dangra/mkinitcpio-tailscale"
license=("GPL-2.0-or-later")
# tailscale is needed at image build time: the install hook copies tailscaled
# into the image, and add_binary fails the build without it.
depends=("mkinitcpio" "tailscale")
optdepends=("jq: node key expiry checking in setup-initcpio-tailscale --check"
  "binutils: UKI inspection in setup-initcpio-tailscale --check")
install=mkinitcpio-tailscale.install
source=("initcpio-hooks-tailscale"
  "initcpio-install-tailscale"
  "setup-initcpio-tailscale"
  "libalpm-hook-tailscale"
  "libalpm-script-tailscale"
  "lib-presets.sh")
sha256sums=('d1c3e7c4c00fde79412593a4a9c088548b5596bfff4278b9e8ac9f928eb68270'
            '2e593e850095b111696116a95687a725f61f548c7dd567a852293d9f71271e0f'
            'a2de3d07c1c7b6c8e52802affdbc0d60a1a553bd710fae9408c9c2669ae132eb'
            '2a68c473a701af5a33e538ac9b6533c1fac6e7191d093b0f8b878071f66d639f'
            '211a8841b28a02b1f3fb41609574c3d24583b13ae89bfec5d284f141dbd37446'
            '150f9f8b80ff22f38af633300ced64616c6d1dc1b891d6480f98a40f7633f1fe')

package() {
  install -m 644 -D "${srcdir}/initcpio-hooks-tailscale" "${pkgdir}/usr/lib/initcpio/hooks/tailscale"
  install -m 644 -D "${srcdir}/initcpio-install-tailscale" "${pkgdir}/usr/lib/initcpio/install/tailscale"
  install -m 755 -D "${srcdir}/setup-initcpio-tailscale" "${pkgdir}/usr/bin/setup-initcpio-tailscale"
  install -m 644 -D "${srcdir}/libalpm-hook-tailscale" "${pkgdir}/usr/share/libalpm/hooks/mkinitcpio-tailscale.hook"
  install -m 755 -D "${srcdir}/libalpm-script-tailscale" "${pkgdir}/usr/share/libalpm/scripts/mkinitcpio-tailscale"
  install -m 644 -D "${srcdir}/lib-presets.sh" "${pkgdir}/usr/lib/mkinitcpio-tailscale/presets.sh"
}
