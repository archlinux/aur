# Maintainer: Ryan Barillos < ryan dot barillos at proton dot me >
# Contributor: Karuna Murti <karuna dot murti at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>
_rhelver=9.0
pkgname=mssql-tools
pkgver=18.4.1.1
pkgrel=1
pkgdesc="Microsoft SQL Server Tools for Linux"
arch=('x86_64' 'aarch64')
url="https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-overview?view=sql-server-ver16"
license=('custom')
depends=('msodbcsql')
optdepends=('mssql-server: Enter T-SQL statements to an SQL Server database')
options=('!strip')
install="${pkgname}.install"
source_x86_64=("https://packages.microsoft.com/rhel/${_rhelver}/prod/Packages/m/${pkgname}18-${pkgver}-${pkgrel}.x86_64.rpm")
source_aarch64=("https://packages.microsoft.com/rhel/${_rhelver}/prod/Packages/m/${pkgname}18-${pkgver}-${pkgrel}.aarch64.rpm")
sha256sums_x86_64=('1e1d77a80e9abb7d98cf9e8b25cdf052302ec5163ae94ab9cd586dbfefb78194')
sha256sums_aarch64=('8bfbd58fefc9d4550fa478b712ce8528f49a18255584045b04228b3907ce4f26')
sha512sums_x86_64=('5663b0b360941fdcfba50972ac2e01f629a0acaf32343de5ab468d06a2a3c11e3c44194454608f2240d698585cdb12300b932115a29942ad5d42d7932b260736')
sha512sums_aarch64=('7489ff2603b68bcdb8d6e4850d209759c6c251da4e944aaf26db3447a7e90a571d28b8ebc0200a477a476caee96a35cc3849e53b82b8f41edefae63d6ebb8bce')

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
