# Maintainer: noideaman <pkgbuilds@weebvr.com>

pkgname=vrchat-avatar-scaler
_pkgname=VRChat-Avatar-Scaler
pkgver=0.2.2
pkgrel=4
pkgdesc="Control your avatar's scale via OSC"
arch=("any")
url="https://github.com/SalbugVR/_$pkgname"
license=("MIT")
depends=("python" "python-osc" "python-pynput" "python-pillow" "python-psutil" "python-tinyoscquery-git")
makedepends=("python-setuptools")
conflicts=("${pkgname}-git" "${pkgname}-nuitka" "${pkgname}-nuitka-git")
source=("https://github.com/SalbugVR/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "vrchat-avatar-scaler.desktop"
	"vrchat-avatar-scaler"
	"scaler_config.json")
sha256sums=('0adc9d6d3464c9c8d39daf6a0d5200016cbda51dcf1293dbc795396ca5ee23ea'
            'a9eb665d62ed0adbdf554d6cdd7727e2713176452b02e9608151b70b4fe704db'
            '9685a2710c75091518e63fcee4a455f8e75dfa204336ca47379b5b290c3aaacb'
            '4e5faca98290b8d3d3bdc73aa6d7da8b20922d8ab8dc7e99d5da637be2ff43f3')
package() {
    #make the dir writable to all
    install -dm757 "$pkgdir/opt/${pkgname}"
    # Install python file
    cp "$srcdir/${_pkgname}-${pkgver}/vrchat_avatar_scaler.pyw" "${pkgdir}/opt/${pkgname}/vrchat_avatar_scaler.pyw"
    # Install config file
    cp "$srcdir/scaler_config.json" "$pkgdir/opt/${pkgname}/scaler_config.json.example"
    
    # Install desktop file
    install -Dm644 "$srcdir/${pkgname}.desktop" \
        "$pkgdir/usr/share/applications/${pkgname}.desktop"
    
    #install launcher
    install -Dm755 "$srcdir/${pkgname}" \
        "$pkgdir/usr/bin/${pkgname}"
}
