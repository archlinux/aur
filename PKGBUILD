# Maintainer: Ryan Barillos < ryan dot barillos at proton dot me >
# Contributor: Karuna Murti <karuna dot murti at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>
_rhelVersion=9.0
_versionMajor=18
_versionMinor=6.2.1

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
sha256sums_aarch64=('cfa174a06dd59fdd340d6824d2c633fd2d978bd026da382510227a1acd0927a5')
sha256sums_x86_64=('fe1ba0ee8e848a54d69dd95aabb3372a1de1fb06a30abfb863d983d0026fb8d7')
sha512sums_aarch64=('7c823ac8bc8213f7eb077c80de0f50861374f6059be38bd52a3f47f3e667eeaf42c51af0f081988877af6858952f3181f3b3c7db06776907130a96b6a2ef745f')
sha512sums_x86_64=('8ec8c5806083f9c7e37e2a9e642b2265e825955f413b8529467ce4b41adc5a260d9917262ef1c989d0242fc179708e34df58860da07776b4f9931b65202ce4da')


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
