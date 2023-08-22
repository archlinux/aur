# Maintainer: Ning Sun <n at sunng dot info>

pkgname=greptimedb-bin
pkgver=0.4.0.20230821
_pkgvergh=v0.4.0-nightly-20230821
pkgrel=1
pkgdesc='Open-source time-series database.'
arch=('x86_64')
url='https://github.com/GreptimeTeam/greptimedb'
license=('Apache-2.0')
provides=('greptimedb')
conflicts=()

source=("https://github.com/GreptimeTeam/greptimedb/releases/download/${_pkgvergh}/greptime-linux-amd64-${_pkgvergh}.tar.gz"
    "greptimedb.sysusers"
    "greptimedb.service"
    "greptimedb-tmpfile.conf"
    "greptimedb.toml")
sha256sums=("e9a631b4f55c69ffe275615caae74030854208c71119d565dc7072032813442c"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP")

package() {
    mkdir -p "${pkgdir}/etc/greptimedb/"
    install -Dm755 "${srcdir}/greptime-linux-amd64-${_pkgvergh}/greptime" "${pkgdir}/usr/bin/greptime"
    install -Dm644 "${srcdir}/greptimedb.service" "${pkgdir}/usr/lib/systemd/system/greptimedb.service"
    install -Dm644 "${srcdir}/greptimedb.sysusers" "${pkgdir}/usr/lib/sysusers.d/greptimedb.conf"
    install -Dm644 "${srcdir}/greptimedb-tmpfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/greptimedb.conf"
    install -Dm644 "${srcdir}/greptimedb.toml" "${pkgdir}/etc/greptimedb/greptimedb.toml"
}
