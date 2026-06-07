# Maintainer: CrystalSky <hello@crystalsky.dev>
#
# Reference PKGBUILD for the AUR package robot36-linux.
# Copy to your AUR checkout at: https://aur.archlinux.org/robot36-linux.git
#
# Build:  makepkg -si
# Regenerate .SRCINFO: makepkg --printsrcinfo > .SRCINFO
# Upload: makepkg --srcinfo && git add -A && git commit && git push

pkgname=robot36-linux
pkgdesc="SSTV Decoder for Linux - decodes Slow Scan Television images from audio input"
pkgver=0.1.1
pkgrel=1
arch=('x86_64')
url="https://git.crystalsky.dev/CrystalSky/robot36-linux"
license=('ISC')
depends=(
    'java-runtime'
    'alsa-lib'
)
optdepends=(
    'pipewire: PipeWire audio backend'
    'jack: JACK audio backend'
)
makedepends=(
    'java-environment'
    'gcc'
    'pkg-config'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
# Replace SKIP with the actual sha256sum when cutting a release
sha256sums=('SKIP')
# For git-based PKGBUILD (tracks main branch), use instead:
# source=("${pkgname}::git+${url}.git")
# sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./build.sh
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Jar
    install -Dm644 build/robot36.jar \
        "${pkgdir}/usr/share/java/robot36/robot36.jar"

    # Native library
    install -Dm755 build/librobot36_audio.so \
        "${pkgdir}/usr/lib/robot36/librobot36_audio.so"

    # Launcher
    install -Dm755 robot36 "${pkgdir}/usr/bin/robot36"

    # Desktop file
    install -Dm644 robot36.desktop \
        "${pkgdir}/usr/share/applications/robot36.desktop"

    # Icon (scalable SVG)
    install -Dm644 icons/hicolor/scalable/apps/robot36.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/robot36.svg"
}
