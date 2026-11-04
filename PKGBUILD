# Maintainer: Fadilah Riczky (itsmefdil) <friczky@gmail.com>

pkgname=termimus-ssh-bin
_pkgname=termimus
pkgver=0.8.0
pkgrel=1
pkgdesc="Self-hosted SSH & Server Manager desktop app (Termius alternative built with Tauri + React)"
arch=('x86_64')
url="https://github.com/termimus/termimus-ssh"
license=('MIT')
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'openssl'
    'webkit2gtk-4.1'
)
provides=('termimus' 'termimus-ssh')
conflicts=('termimus' 'termimus-ssh')
options=('!debug' '!strip')
source=(
    "${pkgname}-${pkgver}.deb::https://github.com/termimus/termimus-ssh/releases/download/v${pkgver}/Termimus_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/termimus/termimus-ssh/v${pkgver}/LICENSE"
)
sha256sums=(
    'c240aff0068392eb5805f1d4a46f0a8c67c9df92b3d66e132c60dd7738ace934'
    '29309b165d9ba5ce70bc0cc32696d034dca05f568cb7b20c87a41ff01ba3cf82'
)

package() {
    bsdtar -xf data.tar.gz -C "${pkgdir}"

    # Symlink command alias
    ln -sf termimus "${pkgdir}/usr/bin/termimus-ssh"

    # Fix desktop categories
    if [ -f "${pkgdir}/usr/share/applications/Termimus.desktop" ]; then
        sed -i 's/^Categories=$/Categories=Network;Utility;System;/' "${pkgdir}/usr/share/applications/Termimus.desktop"
    fi

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
