# Maintainer: Refreeze5911
# Maintainer: Antti <antti@antti.codes>

pkgname=modrinth-app-beta-bin
pkgver=0.8.0
pkgrel=2
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
sha256sums=('8d13479d5a5dceba6ba1e81d6ef41fdc6c47cde20379d8e2823d4159ba4b4f97'
            '5404b4e7b25903afe43ab2f2451be4b27f4823c6785327b166f2faa519fa38a9')

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
