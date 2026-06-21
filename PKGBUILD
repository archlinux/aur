# Maintainer: wasdxl <xiaotianjuewo@foxmail.com>
pkgname=tauritavern-bin
pkgver=2.1.1
pkgrel=2
pkgdesc="A Tauri-based frontend for SillyTavern (Custom build with thin titlebar)"
arch=('x86_64')
url="https://github.com/LX2000WASD/TauriTavern-aur"
license=('AGPL-3.0')
options=('!debug')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libsoup3'
    'libsecret'
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
)
provides=('tauritavern')
conflicts=('tauritavern')

source=("TauriTavern_2.1.1_amd64.deb::https://github.com/LX2000WASD/TauriTavern-aur/releases/download/v2.1.1-2/TauriTavern_2.1.1_amd64.deb")

md5sums=('df561f75eb8585303f0caeae6858d208')

package() {
    cd "${srcdir}"

    bsdtar -xf data.tar.gz

    cp -r usr "${pkgdir}/"

    DESKTOP_FILE="${pkgdir}/usr/share/applications/TauriTavern.desktop"

    if [ -f "$DESKTOP_FILE" ]; then

        sed -i 's|^Exec=tauritavern|Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 tauritavern|' "$DESKTOP_FILE"

        sed -i '/^Categories=/d' "$DESKTOP_FILE"

        echo "Categories=Network" >> "$DESKTOP_FILE"

        if ! grep -q '^Icon=tauritavern' "$DESKTOP_FILE"; then
            echo "Icon=tauritavern" >> "$DESKTOP_FILE"
        fi
    fi
}
