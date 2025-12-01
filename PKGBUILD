# Maintainer: ar1su <traleeee@duck.com>

_pkgname=xermius
pkgname=${_pkgname}-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Xermius - Easy SSH Client"
arch=('x86_64')
url="https://xermius.com"
license=('unknown')

depends=(
    'gtk3'
    'libnotify'
    'nss'
    'libxss'
    'libxtst'
    'xdg-utils'
    'at-spi2-core'
    'util-linux-libs'
    'libsecret'
    'hicolor-icon-theme'
    'desktop-file-utils'
)

optdepends=(
    'libappindicator-gtk3: for system tray icon support'
)

provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')

source_x86_64=("${_pkgname}-${pkgver}.deb::https://app.xermius.com/storage/downloads/xermius_${pkgver}_amd64.deb")
sha512sums_x86_64=('c3010378173b5b65e188f309fa8e6e940e9cfdc528570f5c08a07e3b4a2912d39e2f1bf1e17f43eea744bfd0fb73ac5c06772a1bd9cb4a40234702e37f06753a')

package() {
    cd "${pkgdir}"
    
    # Extract data from the .deb package
    tar -xf "${srcdir}/data.tar.xz"
    
    # Fix permissions
    chmod -R u+w "${pkgdir}"
}

post-install() {
    echo "Updating icon and desktop database caches..."
    ln -sf /usr/share/icons/hicolor/1024x1024/apps/xermius.png /usr/share/icons/hicolor/256x256/apps/xermius.png
    ln -sf /usr/share/icons/hicolor/1024x1024/apps/xermius.png /usr/share/icons/hicolor/128x128/apps/xermius.png
    ln -sf /usr/share/icons/hicolor/1024x1024/apps/xermius.png /usr/share/icons/hicolor/48x48/apps/xermius.png

    gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
    update-desktop-database -q
}
