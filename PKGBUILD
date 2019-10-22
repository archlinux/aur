# Maintainer: Leo_L <Leo dot Lahtinen at protonmail dot com>

pkgname=google-docs-nativefier
pkgver=1
pkgrel=1
pkgdesc="Electron wrapper for the Google Docs web application"
arch=(x86_64)
license=(MIT)
url=https://docs.google.com
source=($pkgname.png
        $pkgname.desktop)
makedepends=(nodejs nodejs-nativefier npm)
sha256sums=('5231652761dce688ddd2f4b2a5b958fd5486acaa181ec239fd9d330d835b5bbb'
            'e7a2eacb79e13849f616ad148adbd2fe570db775a2dd211ba0912292885492d6')

_instname=google-docs

build() {
    nativefier "https://docs.google.com/" \
      --icon $pkgname.png \
      --maximize \
      --internal-urls "(accounts|docs)\.google" \
      --name "Google Docs"
}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$_instname.desktop

    cp -rL $_instname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$_instname "$pkgdir"/usr/bin/$_instname
    ln -sf /opt/$pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$_instname.png

    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}

