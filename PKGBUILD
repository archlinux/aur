# Maintainer: Ning Sun <n at sunng dot info>

pkgname=greptimedb-bin
pkgver=1.1.4
_pkgvergh=v1.1.4
pkgrel=1
pkgdesc='Open-source time-series database.'
arch=('x86_64')
url='https://github.com/GreptimeTeam/greptimedb'
license=('Apache-2.0')
provides=('greptimedb')
conflicts=()
depends=('zlib' 'glibc')
backup=('etc/greptimedb/greptimedb.toml')

source=("https://github.com/GreptimeTeam/greptimedb/releases/download/${_pkgvergh}/greptime-linux-amd64-${_pkgvergh}.tar.gz"
    "greptimedb.sysusers"
    "greptimedb.service"
    "greptimedb-tmpfile.conf"
    "greptimedb.toml")
sha256sums=("096db28629089413248a5700459c4e10bcc33852698a999109cf27ebff0cc992"
    '83e53f6273ce33dc86349d3f9a38bc8427d166c19d4468daf3eace924b3048a8'
    'caf9a83e4e16d69da502dcb4eb42cd7118387a0cca5e0a3b7b36b702452785ac'
    'f11beeeab520997e7538ac8e1ac763f427db0766fdbeaff8c214dc153445b95b'
    '7e9d92e32fa973452667686cb3111a18be6bd4c6a9f0f0587fff9ba11d5d2e61')

package() {
    mkdir -p "${pkgdir}/etc/greptimedb/"
    install -Dm755 "${srcdir}/greptime-linux-amd64-${_pkgvergh}/greptime" "${pkgdir}/usr/bin/greptime"
    install -Dm644 "${srcdir}/greptimedb.service" "${pkgdir}/usr/lib/systemd/system/greptimedb.service"
    install -Dm644 "${srcdir}/greptimedb.sysusers" "${pkgdir}/usr/lib/sysusers.d/greptimedb.conf"
    install -Dm644 "${srcdir}/greptimedb-tmpfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/greptimedb.conf"
    install -Dm644 "${srcdir}/greptimedb.toml" "${pkgdir}/etc/greptimedb/greptimedb.toml"
}
