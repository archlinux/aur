# Maintainer: Nero Blackstone <gf7600gs@gmail.com>

pkgname=owlplug-bin
pkgver=1.31.1
pkgrel=1
pkgdesc="Audio plugin manager. Small tool to manage VST / AU / LV2 plugins on Windows, MacOS and Linux."
arch=('x86_64')
url="https://owlplug.com/"
license=('GPL-3.0')
source=("https://github.com/DropSnorz/OwlPlug/releases/download/${pkgver}/OwlPlug-${pkgver}.deb")
sha256sums=('183b65f216688e7f1f279c71abab3cb90f514bab007178ffeb5601d7e08bd157')

prepare() {
    cd "$srcdir"
    ar x OwlPlug-${pkgver}.deb
    tar -xf data.tar.*
    find . -type d -exec chmod 755 {} +
    find . -type f -exec chmod 644 {} +
}

package() {
    cd "$srcdir"
    cp -r opt "$pkgdir/"

    install -dm755 "$pkgdir/usr/share/applications"
    install -m644 "$pkgdir/opt/owlplug/lib/owlplug-OwlPlug.desktop" \
        "$pkgdir/usr/share/applications/owlplug.desktop"
    
    chmod +x "$pkgdir/opt/owlplug/bin/OwlPlug"
}    