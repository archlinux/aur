# Maintainer: CriticalRange

pkgname=coresound-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Desktop Bluetooth audio controller for Soundcore/Anker devices"
arch=('x86_64')
url="https://github.com/CriticalRange/CoreSound"
license=('GPL-3.0-only')
depends=('fuse2' 'bluez')
options=('!strip')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/CriticalRange/CoreSound/releases/download/v${pkgver}/CoreSound-${pkgver}.AppImage")
sha256sums=('SKIP')

package() {
    install -Dm755 "${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/coresound/coresound.AppImage"

    # Launcher symlink
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/coresound/coresound.AppImage "${pkgdir}/usr/bin/coresound"

    # Desktop entry
    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/coresound.desktop" <<EOF
[Desktop Entry]
Name=CoreSound
Comment=Desktop Bluetooth audio controller for Soundcore/Anker devices
Exec=/opt/coresound/coresound.AppImage
Icon=coresound
Terminal=false
Type=Application
Categories=AudioVideo;Audio;
EOF
}
