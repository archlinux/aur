# Maintainer: Konrad Tegtmeier <konrad.tegtmeier+aur@gmail.com>
# Contributor: Wojtek Gawroński <afronski@gmail.com>

pkgname=nomad-bin
pkgver=0.9.3
pkgrel=1
pkgdesc='A distributed, highly available, datacenter-aware scheduler'
arch=('x86_64')
url="https://nomadproject.io/"
license=('MPL2')
optdepends=('docker: enables docker driver'
            'java-runtime: enables java driver'
            'qemu-headless: enables qemu driver'
            'rkt: enables rkt driver')
provides=('nomad')
conflicts=('nomad')
source=("https://releases.hashicorp.com/nomad/${pkgver}/nomad_${pkgver}_linux_amd64.zip"
        nomad.service
        example.hcl)
sha256sums=('cbd008dd2f3c622cb931ce8e7e6465f5b683e66845eb70adb776c970a8029578'
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
