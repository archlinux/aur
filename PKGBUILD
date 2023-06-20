# Maintainer: Alexis Potelle <alexispotelle at gmail dot com>

_instname=amazon
pkgname=amazon
pkgver=1.0.0
pkgrel=1
pkgdesc="Electron wrapper for amazon shop"
arch=('x86_64')
url=https://www.amazon.com/
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
        
sha256sums=('791f0ed963f7823181fd6b380e312bafb6fd9dc2c2e54daeb476b3d451bcd019'
            '0c0453d9ab323507cec3ace0783523f45ae691121fad406990644f73fa4e5ee1'
            '65f4043f2206e43cbbc510246f6a35a673e829bd8ab5b90b790b1ba7c14ea26b')


build() {
    nativefier $url \
      --icon $pkgname.png \
      --name $_instname \
      --user-agent "Mozilla/5.0 (X11; Linux ${CARCH};) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.133 Safari/537.36"\
      --inject no-scrollbar.css\
      --single-instance \

}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$_instname.desktop

    cp -rL $_instname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$_instname "$pkgdir"/usr/bin/$_instname
    cp $srcdir/$pkgname.png "$pkgdir"/usr/share/pixmaps/$_instname.png

    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}

