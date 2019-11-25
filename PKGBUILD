# Maintainer: Leo_L <Leo dot Lahtinen at protonmail dot com>

pkgname=streamable
pkgver=1
pkgrel=1
pkgdesc="Electron wrapper for streamable"
arch=(x86_64)
license=(MIT)
url=https://streamable.com
source=($pkgname.png
        $pkgname.desktop)
makedepends=(nodejs nodejs-nativefier npm)
sha256sums=('54ac99161a59995f0cd2af9a31a1ad0b90edb5dfc0db7a7e48509d168413f075'
            '92fd1e738a9f4464bfc17cb2a808d6fefa894be1c1e96aa580404279096c6bec')

_instname=streamable

build() {
    nativefier "https://streamable.com/" \
      --icon $pkgname.png \
      --name "Streamable"
}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$_instname.desktop

    cp -rL $_instname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$_instname "$pkgdir"/usr/bin/$_instname
    ln -sf /opt/$pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$_instname.png

    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}

