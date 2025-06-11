# Maintainer: Youn Mélois <youn@melois.dev>
pkgname=fdbmonitor-bin
pkgver=7.3.63
pkgrel=1
pkgdesc='FoundationDB is a scalable, fault-tolerant, ordered key-value store with full ACID transactions.'
arch=('x86_64')
url='https://www.foundationdb.org/'
license=('Apache-2.0')
groups=('foundationdb')
depends=(
    "fdbbackup-bin>=${pkgver}" "fdbbackup-bin<8.0.0"
    "fdbserver-bin>=${pkgver}" "fdbserver-bin<8.0.0"
)
conflicts=('foundationdb-server-bin')
options=('!debug')
install="${pkgname}.install"
source=(
    "${pkgname}.conf"
    "${pkgname}.service"
    "${pkgname}.tmpfiles"
)
source_x86_64=("https://github.com/apple/foundationdb/releases/download/${pkgver}/fdbmonitor.x86_64")
sha256sums=(
    'e0ce39ed384458fa2bf112d0803473a566a6f09937a89460e5b25627120d401e'
    '9d2b381404339a5e2b66f85af1017d6f4796f92d0109089bdf4c6746c55febd7'
    'cf99d319aaed7c8e0c6e70695f0ce8656bf83b81b193fb7a44a9b801c2b72604'
)
sha256sums_x86_64=('c31f41275b4c328248aff26f4dd8380f1115c4aa1d067ed4919a56403e554125')

package() {
    install -Dm644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/foundationdb/foundationdb.conf"
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/foundationdb.service"
    install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/foundationdb.conf"
    install -Dm755 "${srcdir}/fdbmonitor.x86_64" "${pkgdir}/usr/lib/foundationdb/fdbmonitor"
}
