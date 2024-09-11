# Maintainer: Refreeze5911
# Maintainer: Antti <antti@antti.codes>

pkgname=modrinth-app-segfault-fix-bin
pkgver=0.8.7
pkgrel=1
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
sha256sums=('03fd48168abdccf7074d30015ec9aeeae7f684a8b9495102e246b6ed3791b88c'
            '8b4f95adec7a0d84b11c304430b1a1e5bcb8422314072b3c56ed53e22cd22030')

build() {
    cd "$srcdir/"
    tar xf data.tar.gz
}

package() {
    cp -r "${srcdir}/usr/" "${pkgdir}"
    mkdir -p "${pkgdir}/opt/modrinth-app"
    mv "${pkgdir}/usr/bin/modrinth-app" "${pkgdir}/opt/modrinth-app/"
    install -Dm755 "${srcdir}/modrinth-app" "${pkgdir}/usr/bin/modrinth-app"
}
