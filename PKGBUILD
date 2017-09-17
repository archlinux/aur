# $Id$
# Maintainer: Caleb Stewart <caleb.j.stewart@zoho.com>

pkgname=input-fonts-private
pkgver=1.2
pkgrel=3
pkgdesc="a flexible system of fonts designed specifically for code by David Jonathan Ross."
url="http://input.fontbureau.com/"
arch=(any)
license=(custom)
_zipname=Input-Font
source=("$_zipname.zip::http://input.fontbureau.com/build/?fontSelection=whole&a=0&g=0&i=0&l=0&zero=0&asterisk=0&braces=0&preset=default&line-height=1.2&accept=I+do&email=")
noextract=("$_zipname.zip")
sha256sums=("18c69fbe80ed468dbd8445074bd696eb316f0b9102db3bc59a4f89b0d6f6d31d")

prompt() {
    while [ 1 ]; do
        read -p "$1" choice
        case "$choice" in
            y|Y ) return 1;;
            n|N ) return 0;;
        esac
    done
}

prepare() {

    echo "License Agreement: http://input.fontbureau.com/license/"
    read -p "Do you accept the license agreement? [Y/n] " choice

    case "$choice" in
        n|N )
            echo "You must accept the license agreement."
            echo "Installation aborted."
            exit
            ;;
    esac

    mkdir $_zipname
    unzip -d $_zipname $_zipname.zip
}

package() {
    cd "$_zipname"
    files=$(find ./Input_Fonts -name '*.ttf')
    install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
    install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 $files
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
