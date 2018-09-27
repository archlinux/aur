# Maintainer: Konrad Tegtmeier <konrad.tegtmeier+aur@gmail.com>
# Contributor: Wojtek Gawroński <afronski@gmail.com>

pkgname=nomad-bin
pkgver=0.8.6
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
sha256sums=('b5c66eda85fa423a7c07d87024a766740f0a0a25309b530b3538d2cf1ce2b555'
            '6f439a69eb112b628cc731f8ab0964ff8f394ade6b61432b31f2b947ae209c11'
            '01f9b4d29c35c0994a24ba91f4fc3df03406ec41cc7264f202eb54814a758c70')

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
