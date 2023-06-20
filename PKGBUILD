# Maintainer: Alexis Potelle <alexispotelle at gmail dot com>

_instname=lichess
pkgname=lichess
pkgver=1.0.0
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
source=("$pkgname.png"
        "$pkgname.desktop"
        "no-scrollbar.css")
sha256sums=('4569f979e5247143fbcc961ce6017cbf6662b683152d245c004121488ae1ad87'
            '1b9991641ecbd3145673d567c4fc22c26d5e65fbf23a77301dc94d7aaf00b507'
            '65f4043f2206e43cbbc510246f6a35a673e829bd8ab5b90b790b1ba7c14ea26b')


build() {
    nativefier $url \
      --icon $pkgname.png \
      --name $_instname \
      --user-agent "Mozilla/5.0 (X11; Linux ${CARCH};) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.133 Safari/537.36"\
      --inject no-scrollbar.css\
      --internal-urls "(.*?lichess\.org.*?)" \
      --single-instance \
      --tray

}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$_instname.desktop

    cp -rL $_instname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$_instname "$pkgdir"/usr/bin/$_instname
    cp $srcdir/$pkgname.png "$pkgdir"/usr/share/pixmaps/$_instname.png

    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}

