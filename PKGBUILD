# Maintainer LutetiumVanadium <luv.s7000@gmail.com>

pkgname=music-git
_pkgname=music
pkgver=0.0.1
pkgrel=2
pkgdesc="A syncable music player to download and listen to music"
arch=('x86_64')
url="https://github.com/Lutetium-Vanadium/Music-Vue"
_url="https://github.com/lutetium-vanadium/music-vue.git"
license=('GPL')
depends=('ffmpeg')
makedepends=('git' 'python' 'nodejs' 'yarn')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$_url" "${_pkgname}.desktop")
noextract=()
md5sums=('SKIP'
         '6cb912bed64be522369371fee7087411')

prepare() {
    cd "music-vue"

    yarn install
}

build() {
    cd "music-vue"

    yarn build -l dir
}

package() {
    cd "music-vue"
    install -d "${pkgdir}/opt/${_pkgname}"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons"

    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "icons/icon.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

    cp -r "release/linux-unpacked/"* "${pkgdir}/opt/${_pkgname}" -R
}
