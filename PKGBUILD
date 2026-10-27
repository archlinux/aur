# Maintainer: agony <27015 at riseup dot net>

pkgname=whodb-bin
pkgver=0.136.0
_bin=whodb-0.136.0
pkgrel=1
pkgdesc='Database workspace with a web UI (prebuilt)'
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
url='https://github.com/clidey/whodb'
license=('Apache-2.0')
depends=('glibc')
depends_x86_64=('libgcc' 'libstdc++')
depends_aarch64=('libgcc' 'libstdc++')
provides=("whodb=${pkgver}")
conflicts=('whodb')
backup=('etc/conf.d/whodb')
install=whodb.install
_release="${url}/releases/download/${pkgver}"
source=('whodb.conf'
        'whodb.service'
        'whodb.sysusers')
source_x86_64=("${_release}/${_bin}-linux-amd64")
source_aarch64=("${_release}/${_bin}-linux-arm64")
source_armv7h=("${_release}/${_bin}-linux-armv7")
source_riscv64=("${_release}/${_bin}-linux-riscv64")
sha256sums=('94de90ec29ed45fef786194d005b6011ddcdf4dff923448920cb11054f1c4055'
            'f90fb36508968f08d52f0b859bbd8a0b0a36e6258e78ed105fd7e6dd78a6ddbc'
            '907874f38c2748569413955d5722119c9c855efabbbfe30a5a8c7dec8e2e803e')
sha256sums_x86_64=('b880a5c819c7e88419dbe0120d24d1a773cb1c892d5a84f58d138da73aeecfdc')
sha256sums_aarch64=('78a26fae8bf4ba2f254ae6a41233e271d382dc38501511035b6fc9ae4fe264b7')
sha256sums_armv7h=('77e4e27e33f16f6386ca36bd4a78c2c8fdfa254665afb4908334a4d0aae5c266')
sha256sums_riscv64=('77a59325f23ab6d59572c2764d12f99061cb89ebaa1bb474484bdca1aeccc754')

package() {
  install -Dm755 "${_bin}"-linux-* "${pkgdir}/usr/bin/whodb-server"
  install -Dm600 whodb.conf "${pkgdir}/etc/conf.d/whodb"
  install -Dm644 whodb.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 whodb.sysusers "${pkgdir}/usr/lib/sysusers.d/whodb.conf"
}
