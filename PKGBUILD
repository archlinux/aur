# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Konrad Tegtmeier <konrad.tegtmeier+aur@gmail.com>
# Contributor: Wojtek Gawroński <afronski@gmail.com>

pkgname=nomad-bin
pkgver=0.12.4
pkgrel=1
pkgdesc='A distributed, highly available, datacenter-aware scheduler'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://nomadproject.io"
license=('MPL2')
optdepends=('docker: Enables docker driver'
            'java-runtime: Enables java driver'
            'qemu-headless: Enables qemu driver'
            'rkt: Enables rkt driver')
provides=('nomad')
conflicts=('nomad')
depends=('glibc')
backup=(etc/nomad/{server,client}.conf)
source_x86_64=("${pkgname}-${pkgver}.zip::https://releases.hashicorp.com/nomad/${pkgver}/nomad_${pkgver}_linux_amd64.zip")
source_i686=("${pkgname}-${pkgver}.zip::https://releases.hashicorp.com/nomad/${pkgver}/nomad_${pkgver}_linux_386.zip")
source_armv7h=("${pkgname}-${pkgver}.zip::https://releases.hashicorp.com/nomad/${pkgver}/nomad_${pkgver}_linux_arm.zip")
source_aarch64=("${pkgname}-${pkgver}.zip::https://releases.hashicorp.com/nomad/${pkgver}/nomad_${pkgver}_linux_arm64.zip")
source=('nomad-server.service'
        'nomad-client.hcl'
        'nomad-client.service'
        'nomad-server.hcl')
sha256sums_x86_64=('926e19b6d9ff54729f9b156eb1839cd7bcba56956617d6b00600b8ce90a4d970')
sha256sums_i686=('f3019b6a6f84c3cdfe2c93f2d84cf8926f556701ed98e476ea44a6166215399d')
sha256sums_armv7h=('68ebb37e6c5a8c41e33d7bb16e9d83bf21d01c9ea2d4c9e07279154e8ee2741f')
sha256sums_aarch64=('0bad6b0b1569a732ff05045aa3d582f664396abd29565a7467fc6360d0fd0e0e')
sha256sums=('85b6938ba13b450f8b7b9ca281178eea57a9409948b9e70b69d6a66a4dbdaa7b'
            'c3650a0f88cb6c511731e26f25dddfe531de3cb833fa1780ec68273faef97c97'
            '1ddf845cfbb2beff7162bd7299705338cf1611fc9f7dfe6a093e4c9cce43e0d2'
            '428c929e205e6ed4da1668534f413fb7e9484ab88c26f8f866d49f8f6ae207e8')

package() {
  install -Dm0755 nomad "${pkgdir}/usr/bin/nomad"
  install -Ddm750 -o root -g root "${pkgdir}/var/lib/nomad"
  install -Ddm750 "${pkgdir}/etc/nomad"
  for type in server client; do
    install -Dm644 "nomad-${type}.hcl" "${pkgdir}/etc/nomad/${type}.conf"
    install -Dm644 "nomad-${type}.service" \
            "${pkgdir}/usr/lib/systemd/system/nomad-${type}.service"
  done
}