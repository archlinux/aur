# Maintainer: noideaman <pkgbuilds@weebvr.com>

pkgname=vrchat-avatar-scaler
_pkgname=VRChat-Avatar-Scaler
pkgver=0.3.0
pkgrel=1
pkgdesc="Control your avatar's scale via OSC"
arch=("any")
url="https://github.com/SalbugVR/$_pkgname"
license=("MIT")
depends=("python" "python-osc" "python-pynput" "python-pillow" "python-psutil" "python-tinyoscquery-git")
makedepends=("python-setuptools")
conflicts=("${pkgname}-git" "${pkgname}-nuitka" "${pkgname}-nuitka-git")
source=("https://github.com/SalbugVR/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "vrchat-avatar-scaler.desktop"
	"vrchat-avatar-scaler"
	"scaler_config.json")
sha256sums=('c8914dfcc94b21f7bbff5337591e2b7d11664885ff2d042b0f6b6ea8de0e3044'
            'a9eb665d62ed0adbdf554d6cdd7727e2713176452b02e9608151b70b4fe704db'
            '9685a2710c75091518e63fcee4a455f8e75dfa204336ca47379b5b290c3aaacb'
            '89dde327e08dc9951f3ea29a440fdbe64b665ea1679328899dc321dcd6a12c69')
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
