pkgname=bnf-nativefier
pkgver=0.0.1
pkgrel=1


pkgdesc="Electron wrapper for the British National Formulary built with Nativefier"
arch=(x86_64)
license=(MIT)
url=https://bnf.nice.org.uk/
source=($pkgname.png
        $pkgname.desktop)
makedepends=(nodejs nodejs-nativefier npm)
sha256sums=('df3534feaba4712d39a4b7e2c3c49542d5e9f587a857ad3233ffd808a7ff79d1'
            'e3b35b3c8ce7fe12eddef0cae641f3071cd7ae7c0fda7dd4bbd5de109a418948')

_instname=bnf

build() {
    nativefier "https://bnf.nice.org.uk/" \
      --icon $pkgname.png \
      --maximize \
      --name $_instname \
      --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/87.0" \
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

