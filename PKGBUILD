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
source=("https://packages.microsoft.com/rhel/${_rhelver}/prod/Packages/m/${pkgname}18-${pkgver}-${pkgrel}.${arch}.rpm")
sha256sums=('1e1d77a80e9abb7d98cf9e8b25cdf052302ec5163ae94ab9cd586dbfefb78194')
sha512sums=('5663b0b360941fdcfba50972ac2e01f629a0acaf32343de5ab468d06a2a3c11e3c44194454608f2240d698585cdb12300b932115a29942ad5d42d7932b260736')

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
