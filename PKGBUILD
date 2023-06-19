# Maintainer: Alexis Potelle <alexispotelle at gmail dot com>

_instname=chess.com
pkgname=chess.com
pkgver=1.0.0
pkgrel=1
pkgdesc="Electron wrapper for Chess.com chess platform"
arch=('x86_64')
url=https://www.chess.com/
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
sha256sums=('3aaf53d144cc6383bc614aa0b538218f187c9d299024a57884c013a55e869e4f'
            'd55d600b9fca9a6d29ac9f49088e72ad40fdeff81a22de278145c597f9dc2421'
            '65f4043f2206e43cbbc510246f6a35a673e829bd8ab5b90b790b1ba7c14ea26b')


build() {
    nativefier $url \
      --icon $pkgname.png \
      --name $_instname \
      --user-agent "Mozilla/5.0 (X11; Linux ${CARCH};) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.133 Safari/537.36"\
      --inject no-scrollbar.css\
      --internal-urls "(.*?chess\.com.*?)" \
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

