# Maintainer: Alex Szczuczko <alex@szc.ca>
# Contributor: TDY <tdy.aur@gmail.com>

pkgname=ceylon
pkgver=1.3.1
pkgrel=1
pkgdesc="A powerful statically typed language for writing large programs in groups"
arch=("any")
url="https://ceylon-lang.org/"
license=("Apache" "custom:GPL-CP" "LGPL")
install="${pkgname}.install"
depends=("java-environment>=7" "bash")
optdepends=("nodejs: for JavaScript interoperability")
source=("https://downloads.ceylon-lang.org/cli/$pkgname-$pkgver.zip")
sha256sums=("3bbc58fd00ead7cc43bb49d54d11a95db9d6ead4799aecab108e290c3b890159")

package() {
    cd "$srcdir/$pkgname-$pkgver"

    #
    # Main files
    #

    # General
    install -dm755 "$pkgdir/usr/share/java/$pkgname/"
    cp -a contrib bin doc lib repo samples templates "$pkgdir/usr/share/java/$pkgname/"
    find "$pkgdir/usr/share/java/$pkgname/" -type d -print0 | xargs -0 chmod 755
    find "$pkgdir/usr/share/java/$pkgname/" -type f -print0 | xargs -0 chmod 644

    # Bin
    find "$pkgdir/usr/share/java/$pkgname/" -type f -name '*.bat' -print0 | xargs -0 rm
    chmod 755 "$pkgdir/usr/share/java/$pkgname/bin/ceylon"

    #
    # System integration
    #

    # Bin
    install -dm755 "$pkgdir/usr/bin/"
    ln -s "/usr/share/java/$pkgname/bin/ceylon" "$pkgdir/usr/bin/$pkgname"

    # Completion
    install -dm755 "$pkgdir/usr/share/bash-completion/completions/"
    ln -s "/usr/share/java/$pkgname/contrib/scripts/ceylon-completion.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"

    # Doc
    install -dm755 "$pkgdir/usr/share/doc/"
    ln -s "/usr/share/java/$pkgname/doc/" "$pkgdir/usr/share/doc/$pkgname"
    # Man
    install -dm755 "$pkgdir/usr/share/"
    mv "$pkgdir/usr/share/java/$pkgname/doc/man" "$pkgdir/usr/share/"
    # Info
    install -dm755 "$pkgdir/usr/share/"
    mv "$pkgdir/usr/share/java/$pkgname/doc/en/spec/info" "$pkgdir/usr/share/"

    # License
    install -Dm644 LICENSE-GPL-CP "$pkgdir/usr/share/licenses/$pkgname/GPL-CP"
    install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
