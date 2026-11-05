# Maintainer: agony <27015 at riseup dot net>

pkgname=krakend-bin
pkgver=3.0.3
pkgrel=1
pkgdesc='High-performance, stateless, declarative API gateway (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/krakend/krakend-ce'
license=('Apache-2.0')
depends=('glibc')
provides=("krakend=${pkgver}")
conflicts=('krakend')
backup=('etc/krakend/krakend.json')
install=krakend.install
_release="${url}/releases/download/v${pkgver}"
source=("krakend-${pkgver}.service::https://raw.githubusercontent.com/krakend/krakend-ce/v${pkgver}/builder/files/krakend.service"
        'krakend.sysusers')
source_x86_64=("${_release}/krakend_${pkgver}_amd64_generic-linux.tar.gz"{,.asc})
source_aarch64=("${_release}/krakend_${pkgver}_arm64_generic-linux.tar.gz"{,.asc})
sha256sums=('17afd32db829065d7ca5a7ab2c729ba0f076a7d4b6465ee182f23c7869a310ca'
            '6710405313f2e37386f5299581058a0ba5e14bd800262a04759c0faa98e48c08')
sha256sums_x86_64=('1792a4cc55a99b24c695dacb5fb5728d824a5b7aab4d7e0a5f436212c43ed638'
                   'SKIP')
sha256sums_aarch64=('dde9f0422a089bd81b7f4848cc06a27896a7237e7e631136c5eb582fb79aea8e'
                    'SKIP')
validpgpkeys=('5B270F2E01E375FD9D5635E25DE6FD698AD6FDD2') # Devops Faith Package Manager

package() {
  install -Dm755 usr/bin/krakend -t "${pkgdir}/usr/bin"
  install -Dm644 etc/krakend/krakend.json -t "${pkgdir}/etc/krakend"
  install -Dm644 "krakend-${pkgver}.service" "${pkgdir}/usr/lib/systemd/system/krakend.service"
  install -Dm644 krakend.sysusers "${pkgdir}/usr/lib/sysusers.d/krakend.conf"
}
