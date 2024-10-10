# Maintainer: Christian Schendel < doppelhelix@gmail.com >

pkgname=fortune-mod-de
pkgver=0.36
pkgrel=5
pkgdesc="Fortune Cookies in german, from the Debian project"
arch=('any')
url="https://salsa.debian.org/debian/fortunes-de"
license=(
    'GPL-2.0-or-later'
)
depends=(
    'fortune-mod'
)
makedepends=(
    'git'
    'recode'
)
source=("$pkgname::git+$url.git#tag=upstream/0.36"
)
sha256sums=('a910d0b161412c077bc02f71e9d4f2da9caf3cc919e485c5bf62f1bcd05217cc')

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
