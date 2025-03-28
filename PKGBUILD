# Maintainer: Alleop <aur dot contest432 at passinbox dot com>
_pkgname=freetube
pkgname=$_pkgname-electron-bin
pkgver=0.23.3
pkgrel=1
pkgdesc='An open source desktop YouTube player built with privacy in mind, with the system electron (unsupported).'
arch=('any')
url='https://github.com/FreeTubeApp/FreeTube'
license=('AGPL-3.0-or-later')
depends=('electron' 'ttf-liberation')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('freetube.sh' "https://raw.githubusercontent.com/FreeTubeApp/FreeTube/refs/tags/v$pkgver-beta/LICENSE"
        "$url/releases/download/v$pkgver-beta/${_pkgname}_${pkgver}_armv7l.deb")
b2sums=('0b68a408d057c048d87ecd8ff3941734fa520f36dd4e84a740228e860a073e15c6bff7ec30070367651b765642a71c88fec18d2cfd68c4d123d4aa90b842fa60'
        '6fa2a6adf165a614637f4aae5b323c427b99c2d13f9ab55eefae012dc3dbeebe5957cd2e2497e4c38426088a41dac89f6ac6284af6cf6a4a67a6780f409e8237'
        'fcbff98f0649f6ea82e1635dd446b270866ffdd56dfd0b18cd167c598ef3af80fbc7cf6cc13af3f101f4017279789291c7328a2b0c0cef4fba8360d822a63b6d')

prepare() {
    tar xf data.tar.xz
    sed -i 's/\/opt\/FreeTube\/freetube/\/usr\/bin\/freetube/' "$srcdir/usr/share/applications/freetube.desktop"
}

package() {
    install -Dm644 "$srcdir/opt/FreeTube/resources/app.asar" "$pkgdir/usr/lib/$pkgname/app.asar"
    install -Dm644 "$srcdir/usr/share/applications/freetube.desktop" "$pkgdir/usr/share/applications/freetube.desktop"
    install -Dm644 "$srcdir/usr/share/icons/hicolor/scalable/apps/freetube.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/freetube.svg"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm755 './freetube.sh' "$pkgdir/usr/bin/freetube"
}
