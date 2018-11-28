# Maintainer: Jan Holthuis <holthuis dot jan at googlemail dot com>

pkgname=openclaw
_gitname=OpenClaw
pkgver=0.3
pkgrel=1
pkgdesc="Reimplementation of Captain Claw (1997) platformer"
arch=('i686' 'x86_64')
url='https://github.com/pjasicek/OpenClaw'
license=('GPL3')
depends=('sdl2' 'sdl2_gfx' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'tinyxml')
makedepends=('cmake')
optdepends=(
    'mono: launcher support'
    'timidity++: background music support'
    'timidity-freepats: background music support'
)
source=(
    "https://github.com/pjasicek/${_gitname}/archive/v${pkgver}.tar.gz"
    "https://github.com/pjasicek/${_gitname}/releases/download/v0.0/openclaw-1.0-1.x86_64.rpm"
)
sha256sums=(
    '3aff09241ce9cb574829741fd1ea11d0c0b1b334ea8893aaf49827f3c5631ac9'
    '99095cc136e35701016bc5f70bcb8b0cb20538fc0a778cdccd38c4275ca85441'
)
install='openclaw.install'

build() {
    mkdir -p "${srcdir}/${_gitname}-$pkgver/build"
    cd "${srcdir}/${_gitname}-$pkgver/build"
    cmake ..
    make
}

package() {
    cd "${srcdir}/${_gitname}-$pkgver/Build_Release"

    # Binaries
    install -Dm644 'ClawLauncher.exe' "${pkgdir}/usr/bin/ClawLauncher.exe"
    install -Dm755 'clawlauncher' "${pkgdir}/usr/bin/clawlauncher"
    install -Dm755 'openclaw' "${pkgdir}/usr/bin/openclaw"

    # Recreated Assets
    install -Dm644 'ASSETS.ZIP' "${pkgdir}/usr/share/openclaw/ASSETS.ZIP"
    install -Dm644 'clacon.ttf' "${pkgdir}/usr/share/openclaw/clacon.ttf"
    install -Dm644 'console02.tga' "${pkgdir}/usr/share/openclaw/console02.tga"
    install -Dm644 'SAVES.XML' "${pkgdir}/usr/share/openclaw/SAVES.XML"
    install -Dm644 'config_linux_release.xml' "${pkgdir}/usr/share/openclaw/config.xml"

    # Original Game Assets (from the rpm file)
    install -Dm644 "${srcdir}/usr/share/openclaw/CLAW.REZ" "${pkgdir}/usr/share/openclaw/CLAW.REZ"
}
