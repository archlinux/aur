# Maintainer: Antti <antti@antti.codes>

pkgname=modrinth-app-bin
pkgver=0.8.5
pkgrel=3
pkgdesc='An unique, open source launcher that allows you to play your favorite mods, and keep them up to date, all in one neat little package.'
url='https://modrinth.com/app'
arch=('x86_64')
license=('GPL-3.0-only')
depends=(
    # tauri deps
    'openssl-1.1' 'dbus' 'freetype2' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libsoup' 'webkit2gtk-4.1'
    # minecraft deps
    'libgl' 'libpulse' 'libx11' 'libxcursor' 'libxext' 'libxxf86vm'
)
optdepends=(
    'xorg-xrandr: for older minecraft versions'
)
provides=('modrinth-app')
conflicts=('modrinth-app')
source=(
    "https://launcher-files.modrinth.com/versions/${pkgver}/linux/Modrinth%20App_${pkgver}_amd64.deb"
    "modrinth-app"
)
sha256sums=('09dae4684b034a796219d722cf809a584be933b1927c077c202e8065e89ce9b9'
            '36e148d33de4028a32b4224a326bacf2de490827fa17d58b302b6afa7164acd7')

build() {
    cd "$srcdir/"
    tar xf data.tar.gz
}

package() {
    cp -r "${srcdir}/usr/" "${pkgdir}"
    mkdir -p "${pkgdir}/opt/modrinth-app"
    mv "${pkgdir}/usr/bin/theseus_gui" "${pkgdir}/opt/modrinth-app/"
    install -Dm755 "${srcdir}/modrinth-app" "${pkgdir}/usr/bin/modrinth-app"
    install -Dm755 "${srcdir}/modrinth-app" "${pkgdir}/usr/bin/theseus_gui"
}
