# Maintainer: agony <27015 at riseup dot net>

pkgname=whodb-bin
pkgver=0.139.0
_bin=whodb-0.139.0
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
        'whodb.sysusers'
        "whodb-${pkgver}-NOTICE::https://raw.githubusercontent.com/clidey/whodb/${pkgver}/NOTICE")
source_x86_64=("${_release}/${_bin}-linux-amd64")
source_aarch64=("${_release}/${_bin}-linux-arm64")
source_armv7h=("${_release}/${_bin}-linux-armv7")
source_riscv64=("${_release}/${_bin}-linux-riscv64")
sha256sums=('94de90ec29ed45fef786194d005b6011ddcdf4dff923448920cb11054f1c4055'
            'f90fb36508968f08d52f0b859bbd8a0b0a36e6258e78ed105fd7e6dd78a6ddbc'
            '907874f38c2748569413955d5722119c9c855efabbbfe30a5a8c7dec8e2e803e'
            '37540f248340b95d3a57125a8c5bda9a5a5cd332ec747d0ca15e2d7b83c5f4c0')
sha256sums_x86_64=('ce064842bf0829c80d36e0844324c54b94178ecc0e81feb0bcb602bf9535b60a')
sha256sums_aarch64=('bec3651eeef487c7ffdab9ec72d61159134274eaddd7e5b61b6d16550b916728')
sha256sums_armv7h=('943e42c18a8120c89a2fe2be0c33b78e665bbcff01bf27a3424fabcaa1d4d834')
sha256sums_riscv64=('cad206e8f860bb4d53902c08c90d5a660d42c1674db13574703900cc67274681')

package() {
  install -Dm755 "${_bin}"-linux-* "${pkgdir}/usr/bin/whodb-server"
  install -Dm600 whodb.conf "${pkgdir}/etc/conf.d/whodb"
  install -Dm644 whodb.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 whodb.sysusers "${pkgdir}/usr/lib/sysusers.d/whodb.conf"
  install -Dm644 "whodb-${pkgver}-NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
