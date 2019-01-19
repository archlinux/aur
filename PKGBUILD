# Maintainer: Konrad Tegtmeier <konrad.tegtmeier+aur@gmail.com>
# Contributor: Wojtek Gawroński <afronski@gmail.com>

pkgname=nomad-bin
pkgver=0.8.7
pkgrel=1
pkgdesc='A distributed, highly available, datacenter-aware scheduler (incl LXC driver)'
arch=('x86_64')
url="https://nomadproject.io/"
license=('MPL2')
depends=('lxc')
optdepends=('docker: enables docker driver'
            'java-runtime: enables java driver'
            'qemu-headless: enables qemu driver'
            'rkt: enables rkt driver')
provides=('nomad')
conflicts=('nomad')
source=("https://releases.hashicorp.com/nomad/${pkgver}/nomad_${pkgver}_linux_amd64-lxc.zip"
        nomad.service
        example.hcl)
sha256sums=('ef147af97637dc52e9becb50e4f19c496c462316a7e896b9b7a0ce31232512c1'
            'SKIP'
            'SKIP')

package() {
  # binary
  install -Dm0755 nomad "${pkgdir}/usr/bin/nomad"

  # configuration
  install -Ddm750 "${pkgdir}/etc/nomad"
  install -Dm644 example.hcl "${pkgdir}/etc/nomad/example.hcl"

  # services & runtime
  install -Ddm750 -o root -g root "${pkgdir}/var/lib/nomad"
  install -Dm644 nomad.service "${pkgdir}/usr/lib/systemd/system/nomad.service"
}
