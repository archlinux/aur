# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Konrad Tegtmeier <konrad.tegtmeier+aur@gmail.com>
# Contributor: Wojtek Gawroński <afronski@gmail.com>

pkgname=nomad-bin
pkgver=1.1.1
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
sha256sums=('85b6938ba13b450f8b7b9ca281178eea57a9409948b9e70b69d6a66a4dbdaa7b'
            'c3650a0f88cb6c511731e26f25dddfe531de3cb833fa1780ec68273faef97c97'
            '1ddf845cfbb2beff7162bd7299705338cf1611fc9f7dfe6a093e4c9cce43e0d2'
            '428c929e205e6ed4da1668534f413fb7e9484ab88c26f8f866d49f8f6ae207e8')
sha256sums_x86_64=('cbb4725e3e10b016b1682db8b0b54d1a1f60d84f0258aa488201dc71f20dc75c')
sha256sums_i686=('4723fc187a4c944f170e37b0bccbdfddb9e26a24da5dbda0f581496aa590c438')
sha256sums_armv7h=('cbc621f0a60fdf0c86224f3f67f183431de8f3fb10ca16b566aff5c84efca65d')
sha256sums_aarch64=('6301f9aa2c66edb7442f7b0ce75e96d2d157b378f84aafe1014c8e01c8278d3d')

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
