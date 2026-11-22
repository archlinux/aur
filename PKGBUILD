# Maintainer: Nero Blackstone <gf7600gs@gmail.com>

pkgname=owlplug-bin
pkgver=2.1.1
pkgrel=2
pkgdesc="Audio plugin manager. Small tool to manage VST / AU / LV2 plugins on Windows, MacOS and Linux."
arch=('x86_64')
url="https://owlplug.com/"
license=('GPL-3.0')
depends=('alsa-lib' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst')
source=("https://github.com/DropSnorz/OwlPlug/releases/download/${pkgver}/OwlPlug-${pkgver}-linux-x64.deb")
sha256sums=('1028911cd4714d337abe02415784e61b93a01be799c956e4d35b8c8024b9c65c')

prepare() {
    cd "$srcdir"
    ar x OwlPlug-${pkgver}-linux-x64.deb
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