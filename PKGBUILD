# Maintainer: Daniel Escoz <darkhogg[at]gmail[dot]com>
pkgname=trainsported-git
pkgver=r560.f604786
pkgrel=1
pkgdesc="A game about writing train AIs."
url="http://trainsportedgame.no-ip.org/"
arch=('any')
license=('custom:WTFPL')
depends=('love')
options=('!strip')
source=('run.sh' 'trAInsported.desktop' 'trAInsported.png'
    $pkgname::git+https://github.com/Germanunkol/trAInsported.git#branch=master)
md5sums=('65f1b46ffee8c96914b1f121eb2703a5'
         '6ef33bd49969d8bcfda28a0a918f341c'
         '5cfd991d4c8680e781176028dc3981d1'
         'SKIP')
_lovefile="trAInsported.love"

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd "$srcdir"

    sed -i "$srcdir/run.sh" \
        -e "s#@@BASEDIR@@#/opt/trAInsported#" \
        -e "s#@@LOVEFILE@@#$_lovefile#"
}

package () {
    cd "$srcdir"

    install -Ddm755 "$pkgdir/opt/trAInsported"
    cp -r "$srcdir/$pkgname"/* "$pkgdir/opt/trAInsported"

    install -Dm755 "run.sh" "$pkgdir/usr/bin/trAInsported"
    install -Dm644 "trAInsported.desktop" "$pkgdir/usr/share/applications/trAInsported.desktop"
    install -Dm644 "$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm544 "trAInsported.png" "$pkgdir/usr/share/pixmaps/trAInsported.png"
}
