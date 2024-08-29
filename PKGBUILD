# Maintainer: Refreeze5911
# Maintainer: Antti <antti@antti.codes>

pkgname=modrinth-app-beta-bin
pkgver=0.8.3
pkgrel=1
pkgdesc='A unique, open-source launcher that allows you to play your favorite mods, and keep them up to date, all in one neat little package.'
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
    "https://modrinth-betas.flawcra.cc/versions/${pkgver}-${pkgrel}/linux/modrinth-app_${pkgver}-${pkgrel}_amd64.deb"
    "modrinth-app"
)
sha256sums=('4740a5b5e21627c44998c900d8744ae9cdb4512badc06421a2f81b3ef63eccee'
            '3a122138375fa8c8e38be9e11e33f39e784fe895e0490d00967c9a6173145508')

build() {
    cd "$srcdir/"
    tar xf data.tar.gz
}

package() {
    cp -r "${srcdir}/usr/" "${pkgdir}"
    mkdir -p "${pkgdir}/opt/modrinth-app"
    mv "${pkgdir}/usr/bin/theseus_gui" "${pkgdir}/opt/modrinth-app/"
    install -Dm755 "${srcdir}/modrinth-app" "${pkgdir}/usr/bin/"
    install -Dm755 "${srcdir}/modrinth-app" "${pkgdir}/usr/bin/theseus_gui"
}
