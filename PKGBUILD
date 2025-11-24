# Maintainer: Auto Generated <auto@generated>
pkgname=audacity4-alpha
pkgver=4.0.0_alpha2
pkgrel=1
pkgdesc="Audacity 4.0.0 Alpha 2 (AppImage)"
arch=('x86_64')
url="https://github.com/audacity/audacity"
license=('GPL-3.0-or-later')
options=('!strip')
noextract=("${pkgname}-${pkgver}.zip")
_url="https://github.com/audacity/audacity/releases/download/Audacity-4.0.0-alpha-2/AU4_253031629_Lin__release-4.0.0-alpha2.zip"
source=("${pkgname}-${pkgver}.zip::${_url}"
        "${pkgname}.desktop")
sha256sums=('3d62b916ccb3431eb103db2d712a1c2accd2bf8a4124189396844c7651fae4bf'
            'SKIP')

prepare() {
    cd "$srcdir"
    bsdtar -xf "${pkgname}-${pkgver}.zip"
}

package() {
    cd "$srcdir"
    
    # Find the AppImage file (handling the complex name)
    local appimage=$(find . -maxdepth 1 -name "Audacity-*.AppImage" -print -quit)
    
    if [ -z "$appimage" ]; then
        echo "Error: AppImage not found in source" >&2
        return 1
    fi

    # Install AppImage
    install -Dm755 "$appimage" "$pkgdir/opt/$pkgname/audacity.AppImage"
    
    # Create /usr/bin symlink
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/audacity.AppImage" "$pkgdir/usr/bin/$pkgname"

    # Install desktop file
    install -Dm644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}