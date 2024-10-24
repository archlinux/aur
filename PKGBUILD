# Maintainer: Walwe <aur@walwe.de>
# Contributor: Mark Gross <mark.gross2001@gmail.com>
pkgname=jetbrains-resharper-commandlinetools
pkgver=2024.2.6
pkgrel=2
pkgdesc="JetBrains ReSharper Command Line Tools"
arch=('x86_64')
url="https://www.jetbrains.com/resharper"
license=('custom:jetbrains')
depends=('dotnet-sdk')
source=("https://download-cdn.jetbrains.com/resharper/dotUltimate.${pkgver}/JetBrains.ReSharper.CommandLineTools.${pkgver}.zip")
sha256sums=('b71d9d2c4793ef293107d1c01fdaa887179311a9a3b44c81e7f42328b1689447') 

prepare() {
    # patch scripts to reference the correct directory
    sed -Ei 's/\$\(dirname "\$0"\)/"\/opt\/'"$pkgname"'"/g' "$srcdir/cleanupcode.sh" "$srcdir/inspectcode.sh"
}

package() {
    install -d "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/"* "$pkgdir/opt/$pkgname"

    # create symlinks in /usr/bin
    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/cleanupcode.sh" "$pkgdir/usr/bin/cleanupcode"
    ln -s "/opt/$pkgname/inspectcode.sh" "$pkgdir/usr/bin/inspectcode"
}


# vim:set ts=2 sw=2 et:
