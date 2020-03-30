# Maintainer: Leo_L <Leo dot Lahtinen at protonmail dot com>

pkgname=google-docs-nativefier
pkgver=1
pkgrel=2
pkgdesc="Electron wrapper for the Google Docs web application"
arch=(x86_64)
license=(MIT)
url=https://docs.google.com
source=($pkgname.png
        $pkgname.desktop)
makedepends=(nodejs nodejs-nativefier npm)
sha256sums=('5231652761dce688ddd2f4b2a5b958fd5486acaa181ec239fd9d330d835b5bbb'
            'e3f241fc5eba29bf3f5f4ade5fb7cf4ca9426a1ddc34548d7224e5b372db49e4')

_instname=GoogleDocs

build() {
    nativefier "https://docs.google.com/" \
      --icon $pkgname.png \
      --maximize \
      --name "$_instname" \
      --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/70.0" \
      --internal-urls "(.*?docs\.google\.com.*?|.*?accounts\.google\.com.*?)" \
      --single-instance \
      --electron-version 7.1.11
}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$_instname.desktop

    cp -rL $_instname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$_instname "$pkgdir"/usr/bin/$_instname
    ln -sf /opt/$pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$_instname.png

    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}

