# Maintainer: Christian Schendel < doppelhelix@gmail.com >

pkgname=fortune-mod-de
pkgver=0.37
pkgrel=1
pkgdesc="Fortune Cookies in german, from the Debian project"
arch=('any')
url="https://salsa.debian.org/debian/fortunes-de"
license=(
    GPL-2.0-or-later
)
depends=(
    fortune-mod
)
makedepends=(
    git
    recode
)
source=("$pkgname::git+$url.git#tag=upstream/$pkgver"
)
b2sums=('20edade24364bf66c4c4f5a6b9488591b0330cd5515ae7b411d954be95ea0cc43411d4274cd4e895a273b5cc6079603f5984be6a47e77ffbe66ed02ac14583e8')

build() {
    cd "$pkgname"
    PREFIX=$(pwd)/build \
    DOCDIR=usr/share/doc/${pkgname} \
    BINDIR=usr/bin \
    FORTUNESDIR=usr/share/fortune \
        ./install.sh -utf8
}

package() {
    cd "$pkgname/build"
    rm -r {man,usr/bin}
    cp -r ./* "${pkgdir}"
    # Remove *.u8 files and strip ".fortunes" from filenames
    cd "$pkgdir/usr/share/fortune/de"
    mv debian debian-de
    mv debian.dat debian-de.dat
    rm ./*.u8
    mv ./* ..
    cd "$pkgdir/usr/share/fortune"
    rm -r de
}

# vim: set ts=4 sw=4 et:
