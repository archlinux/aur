# Maintainer: Teteros <teteros at teknik dot io>

_pkgname=protrekkr
pkgname=protrekkr-git
pkgver=r687.dca6ef0
pkgrel=1
pkgdesc="Tracker program to for small sized intros, demos or games. (PaulBatchelor's fork)"
arch=('i686' 'x86_64')
url="http://pbat.ch/proj/protrekkr/"
license=('BSD')
depends=('jack' 'liblo' 'lua' 'sdl')
makedepends=('git' 'sporth-git' 'soundpipe-git' 'runt-git')
provides=('protrekkr')
conflicts=('protrekkr')
source=("git://github.com/PaulBatchelor/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # Replace hardcoded /usr/local prefixes
    find "$_pkgname" -type f -execdir sed -i "s|/usr/local|/usr|g" {} \;
}

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "$_pkgname"

    install -Dm755 bin/protrekkr "$pkgdir/usr/bin/protrekkr"
    install -dm755 "$pkgdir/usr/share/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cp -a bin/skins "$pkgdir/usr/share/$_pkgname"
}
