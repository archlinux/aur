# Maintainer: noideaman <pkgbuilds@weebvr.com>

pkgname=oscleash
_pkgname=OSCLeash
pkgver=2.2.0
pkgrel=7
pkgdesc="Get pulled around in VRChat"
arch=("any")
url="https://github.com/ZenithVal/$pkgname"
license=("MIT")
depends=("python" "python-osc" "python-inputs")
makedepends=("python-setuptools")
conflicts=("${pkgname}-git" "${pkgname}-nuitka" "${pkgname}-nuitka-git")
source=("https://github.com/ZenithVal/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "OSCLeash.desktop"
        "OSCLeash.svg"
	"oscleash")
sha256sums=('ced2294cd4245c37ac77969dd17d9819a0d197a40fdbda7913c33551524aae88'
            '984dda198cf1417327b959055941c7adea86932c3cdb0a462738644cfd8a7e59'
            '6183c816b8b5ff4a2f60ed8becae841c481c2d3ca60d2580ebd601abfd43835e'
            '2c6986c681d813dbdaa13a66db7333efabcac971eef6203c4914ddd3ef09fa50')
prepare() {
        sed  -i 's/UseOSCQuery.*/UseOSCQuery\"\: true\,/' $srcdir/$_pkgname-$pkgver/Config.json
}
package() {
    # Extract and copy everything to /opt
    install -dm757 "$pkgdir/opt/$_pkgname"
    cp -r "$srcdir/$_pkgname-$pkgver/"* "$pkgdir/opt/$_pkgname/"
    
    # Install desktop file
    install -Dm644 "$srcdir/OSCLeash.desktop" \
        "$pkgdir/usr/share/applications/oscleash.desktop"
    
    # Install icon
    install -Dm644 "$srcdir/OSCLeash.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/oscleash.svg"

    #install launcher
    install -Dm755 "$srcdir/oscleash" \
        "$pkgdir/usr/bin/oscleash"
    #remove Config.json to let the program generate it on first launch
    mv $pkgdir/opt/$_pkgname/Config.json $pkgdir/opt/$_pkgname/Config.json.example
}
