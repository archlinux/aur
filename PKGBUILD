# Maintainer: Jacques Gaudin <jagaudin at gmail dot com>

_instname=lichess
pkgname=lichess-nativefier
pkgver=0.0.1
pkgrel=1
pkgdesc="Electron wrapper for Lichess.org chess platform"
arch=('x86_64')
url=https://lichess.org
license=('GNU AGPL')
groups=()
depends=()
makedepends=(nodejs nodejs-nativefier npm)
provides=($pkgname)
conflicts=($pkgname)
replaces=()
backup=()
options=()
install=
source=("$pkgname.svg"
        "$pkgname.png"
        "$pkgname.desktop")
sha256sums=('c187cb09116a6f8ea6b1408b50a362c5de50152fd75c87f335a7d3475e8e8dc5'
            '4569f979e5247143fbcc961ce6017cbf6662b683152d245c004121488ae1ad87'
            '1b9991641ecbd3145673d567c4fc22c26d5e65fbf23a77301dc94d7aaf00b507')


build() {
    nativefier "https://lichess.org/" \
      --icon $pkgname.png \
      --name $_instname \
      --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux ${CARCH}; rv:70.0) Gecko/20100101 Firefox/70.0" \
      --internal-urls "(.*?lichess\.org.*?)" \
      --single-instance
}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$_instname.desktop

    cp -rL $_instname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$_instname "$pkgdir"/usr/bin/$_instname
    cp $srcdir/lichess-nativefier.svg "$pkgdir"/usr/share/pixmaps/$_instname.svg

    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}

