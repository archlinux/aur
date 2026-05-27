# Maintainer: Christian Schendel < doppelhelix@gmail.com >

pkgname=fortune-mod-de
pkgver=0.38
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
b2sums=('a2dcf1c9e692d2bea5cd7d089a6f9409b5ecaeed6e2167b2db3a26bf928681da4d0cbdd958c73ead1acbb98ec9123b21f70548b143fa8e8f10a5d1686f723b4d')

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

# vim: set ft=sh ts=4 sw=4 et:
