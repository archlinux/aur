# Maintainer: Refreeze5911
# Maintainer: Antti <antti@antti.codes>

pkgname=modrinth-app-segfault-fix-bin
pkgver=0.8.1
pkgrel=1
pkgdesc='An unique, open source launcher that allows you to play your favorite mods, and keep them up to date, all in one neat little package.'
url='https://modrinth.com/app'
arch=('x86_64')
license=('GPL3')
depends=(
    # tauri deps
    'openssl-1.1' 'dbus' 'freetype2' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libsoup' 'webkit2gtk'
    # minecraft deps
    'libgl' 'libpulse' 'libx11' 'libxcursor' 'libxext' 'libxxf86vm'
)
optdepends=(
    'xorg-xrandr: for older minecraft versions'
)
provides=('modrinth-app')
conflicts=('modrinth-app')
source=(
    "https://launcher-files.modrinth.com/versions/${pkgver}/linux/modrinth-app_${pkgver}_amd64.deb"
    "modrinth-app"
)
sha256sums=('2006d3e0ce83c28c45efe4beecd2515af947c813eb98101d01089d1fa71ec8c0'
            '8b4f95adec7a0d84b11c304430b1a1e5bcb8422314072b3c56ed53e22cd22030')

build() {
    cd "$srcdir/"
    tar xf data.tar.gz
}

package() {
    cp -r "${srcdir}/usr/" "${pkgdir}"
    mkdir -p "${pkgdir}/opt/modrinth-app"
    mv "${pkgdir}/usr/bin/modrinth-app" "${pkgdir}/opt/modrinth-app/"
    install -Dm755 "${srcdir}/modrinth-app" "${pkgdir}/usr/bin/"
}
