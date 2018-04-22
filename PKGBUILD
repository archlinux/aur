# Maintainer: Konrad Tegtmeier <konrad.tegtmeier+aur@gmail.com>
# Contributor: Wojtek Gawroński <afronski@gmail.com>

pkgname=nomad-bin
pkgver=0.8.1
pkgrel=2
pkgdesc="A distributed, highly available, datacenter-aware scheduler"
arch=('x86_64')
url="https://nomadproject.io/"
license=('MPL2')
optdepends=('docker: enables docker driver'
            'java-runtime: enables java driver'
            'lxc: enables lxc driver (experimental)'
            'qemu-headless: enables qemu driver'
            'rkt: enables rkt driver')
provides=('nomad')
source=("https://releases.hashicorp.com/nomad/${pkgver}/nomad_${pkgver}_linux_amd64-lxc.zip"
        nomad.service
        example.hcl)
sha256sums=('ddbd66050b4597a0e4f1a2cb95af2b9bf3602caa23b953dd910e420a3100a080'
            '71a821050c328bbaeb20222ccc23791c3f0de37524b246c8cf795b162f505027'
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
