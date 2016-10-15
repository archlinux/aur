# Maintainer: Pauli Huttunen <pauli.k.huttunen@gmail.com>

_pkgname=wed-dotfiles
pkgname=$_pkgname-git
pkgver=r35.d4ec174
pkgrel=1
pkgdesc="WhiteEyeDoll's dotfile collection"
arch=('any')
url="https://github.com/WhiteEyeDoll/wed-dotfiles"
license=('Beerware')
depends=()
makedepends=('git')
source=('git://github.com/WhiteEyeDoll/wed-dotfiles')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/"
    install -Dm755 "$srcdir/$_pkgname/src/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    for file in $(ls $srcdir/$_pkgname/src/modules/); do
        install -Dm755 "$srcdir/$_pkgname/src/modules/$file" "$pkgdir/usr/lib/$_pkgname/modules/$file"
    done

    for dir in $(ls $srcdir/$_pkgname/src/resources/); do
        for file in $(ls $srcdir/$_pkgname/src/resources/$dir/); do
            install -Dm644 "$srcdir/$_pkgname/src/resources/$dir/$file" "$pkgdir/usr/share/$_pkgname/resources/$dir/$file"
        done
    done
}
