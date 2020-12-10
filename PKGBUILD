# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Konrad Tegtmeier <konrad.tegtmeier+aur@gmail.com>
# Contributor: Wojtek Gawroński <afronski@gmail.com>

pkgname=nomad-bin
pkgver=1.0.0
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
sha256sums_x86_64=('24102aa16e82330fac7de3b8156eb10d7ef535027c4d33321e7e64d6049442a4')
sha256sums_i686=('126d74d7005ea7e1f8abd89941a8185673d6f50dc49372ba698707bf1210fb2e')
sha256sums_armv7h=('f4fa521c5a11909feee1b24e2b52a3dcfacb24e98febdab5dcbf9cb7d325ba34')
sha256sums_aarch64=('b03d62a2fa6ba99c1acfab53099f3fee8bfd2a381d9a49192c8de6997fd1b0fa')

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
