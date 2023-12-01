# Maintainer: Ryan Barillos < ryan dot barillos at proton dot me >
# Contributor: Karuna Murti <karuna dot murti at gmail dot com>
_rhelver=9.0
pkgname=mssql-tools
pkgver=18.2.1.1
pkgrel=1
pkgdesc="Microsoft® SQL Server® Tools for Linux"
arch=('x86_64')
url="https://www.microsoft.com/en-us/sql-server/sql-server-vnext-including-Linux"
license=('custom')
depends=('msodbcsql')
options=('!strip')
install="${pkgname}.install"
source=("https://packages.microsoft.com/rhel/${_rhelver}/prod/Packages/m/${pkgname}18-${pkgver}-${pkgrel}.${arch}.rpm")
sha256sums=('98758f29f1b1aad13c5ce32a5cf1e849d35a97054d030ee5dccdab6aefd2aef9')
sha512sums=('c33936e0e1e2c74d72e02682fafa39d821352ae2783c8c580bdd96261628bacc7c90a12335ce09e65ce924024347e458189e3146a460575df9e8355b406227a5')

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
