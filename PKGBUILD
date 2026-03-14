# Maintainer: Ryan Barillos < ryan dot barillos at proton dot me >
# Contributor: Karuna Murti <karuna dot murti at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>
_rhelVersion=9.0
_versionMajor=18
_versionMinor=6.1.1

pkgname=mssql-tools
pkgver="${_versionMajor}.${_versionMinor}"
pkgrel=1
pkgdesc="Microsoft SQL Server Tools for Linux"
arch=('x86_64' 'aarch64')
url="https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-overview?view=sql-server-ver16"
license=('custom')
depends=('msodbcsql')
optdepends=('mssql-server: Enter T-SQL statements to an SQL Server database')
options=('!strip')
install="${pkgname}.install"
source_x86_64=("https://packages.microsoft.com/rhel/${_rhelVersion}/prod/Packages/m/${pkgname}${_versionMajor}-${pkgver}-${pkgrel}.x86_64.rpm")
source_aarch64=("https://packages.microsoft.com/rhel/${_rhelVersion}/prod/Packages/m/${pkgname}${_versionMajor}-${pkgver}-${pkgrel}.aarch64.rpm")
sha256sums_aarch64=('ee43f97d8e414b22642f77d892e48bc8211f0497fc49289167433bd66f30739e')
sha256sums_x86_64=('55878228ecf6035b34a296467c50dcefe8e987a1d77c94b9cc8f5abf5d01e51e')
sha512sums_aarch64=('5f399d5502b580825b68b841dc2bc1409ff7a9e500f124cd03edcfee32efd1115ae6fffe1b68ff30b46bd3f204fdc750004ab599dacc4b47eef71ccb98a223c5')
sha512sums_x86_64=('1462e41d104e76a1016b3ff18d90886a4e89f8c71ef6bb61cc95a69fe71d6c0be49266a9aef51f001189dd0f0f30f06b70252425122fedb9bc82e83ee5ac7d71')


package() {
    cd "$srcdir"
    mv usr/share/{doc,licenses}
    mv usr/share/licenses/{${pkgname}18,$pkgname}
    mv opt/{${pkgname}18,$pkgname}
    mv usr opt "$pkgdir"
    
    install -dm755 "$pkgdir"/usr/bin/
    
    cd "$pkgdir"/opt/$pkgname/bin
    for bin in *; do
        ln -s ../../opt/$pkgname/bin/"$bin" "$pkgdir"/usr/bin/"$bin"
    done
}
