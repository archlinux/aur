# Maintainer:  Daniel Graña <dangra at gmail dot com>

pkgname=mkinitcpio-tailscale
pkgver=1.5.0
pkgrel=1
pkgdesc="mkinitcpio hook to launch Tailscale on systemd or busybox based initramfs"
arch=("any")
url="https://github.com/dangra/mkinitcpio-tailscale"
license=("GPL-2.0-or-later")
# tailscale is needed at image build time: the install hook refuses to build
# without the package installed.
depends=("mkinitcpio" "tailscale")
optdepends=("openssh: host key generation for the default Tailscale SSH setup")
source=("initcpio-hooks-tailscale"
  "initcpio-install-tailscale"
  "setup-initcpio-tailscale"
  "libalpm-hook-tailscale"
  "libalpm-script-tailscale")
sha256sums=('b2652386f393f8689eaf06f16ddb4a89e766771e13ffd697a7231d74f226692e'
            'b07ada43744ee62f04fd6c3ddcd293f73fdcd121f2972a9840aca6ea1b647d95'
            '7618e0748e988c5c1c326e209d796038538d8e08574e2ece24b6411faa86fee4'
            '2a68c473a701af5a33e538ac9b6533c1fac6e7191d093b0f8b878071f66d639f'
            '394d750bdb5c5e8817bdc7698551e515069bee8c44f69fd4baebf934b49ba7ad')

package() {
  install -m 644 -D "${srcdir}/initcpio-hooks-tailscale" "${pkgdir}/usr/lib/initcpio/hooks/tailscale"
  install -m 644 -D "${srcdir}/initcpio-install-tailscale" "${pkgdir}/usr/lib/initcpio/install/tailscale"
  install -m 755 -D "${srcdir}/setup-initcpio-tailscale" "${pkgdir}/usr/bin/setup-initcpio-tailscale"
  install -m 644 -D "${srcdir}/libalpm-hook-tailscale" "${pkgdir}/usr/share/libalpm/hooks/mkinitcpio-tailscale.hook"
  install -m 755 -D "${srcdir}/libalpm-script-tailscale" "${pkgdir}/usr/share/libalpm/scripts/mkinitcpio-tailscale"
}
