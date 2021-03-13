# Maintainer: Marat Talipov <t-marat@yandex.ru>
# Based on package "google-docs-nativefier"

pkgname=notion-nativefier
pkgver=1
pkgrel=2
pkgdesc="Electron wrapper for the Notion web application"
arch=(x86_64)
license=(MIT)
url=https://notion.so
source=($pkgname.png
        $pkgname.desktop)
makedepends=(nodejs nodejs-nativefier npm unzip)
sha256sums=('214c257501451b8fee0eee8c66da8ab6a97c807d3236788fc548c613184452bc'
            'f6a63b6bc583c864d2638a02109ab25c785a482c4aa0df2ee64400da167bb42f')

_instname=Notion

build() {
    nativefier "https://notion.so/" \
      --icon $pkgname.png \
      --maximize \
      --name "$_instname" \
      --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/70.0" \
      --internal-urls "(.*?notion\.so.*?)" \
      --single-instance 
}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$_instname.desktop

    cp -rL $_instname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$_instname "$pkgdir"/usr/bin/$_instname
    ln -sf /opt/$pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$_instname.png

    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}
