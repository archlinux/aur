# Maintainer: creations <creations@creations.works>
pkgname=grabit
pkgver=0.9.0
pkgrel=2
pkgdesc="Screenshot, screen-recording, OCR, and uploader for wlroots and KDE Plasma 6 Wayland compositors"
arch=('x86_64' 'aarch64')
url="https://heliopolis.live/creations/grabit"
license=('AGPL-3.0-or-later')
depends=(
    'cairo'
    'curl'
    'dbus'
    'file'
    'json-c'
    'libjpeg-turbo'
    'libpipewire'
    'libpng'
    'libwebp'
    'libxkbcommon'
    'wayland'
)
makedepends=(
    'git'
    'wayland-protocols'
)
optdepends=(
    'ffmpeg: --record support, and video thumbnails and playback in the settings history'
    'tesseract: --tesseract (OCR) support'
    'tesseract-data-eng: english OCR data'
    'translate-shell: --translate (OCR -> translated text) support'
    'xdg-utils: open links, files and folders from previews, pins, history and settings'
    'pipewire: pw-play (default shutter-sound player)'
    'libpulse: paplay (alternative sound player)'
    'alsa-utils: aplay (alternative sound player)'
    'sox: play (alternative sound player)'
)
conflicts=('grabit-bin' 'grabit-git')
source=("grabit-${pkgver}::git+https://heliopolis.live/creations/grabit.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/grabit-${pkgver}"
    make all VERSION="${pkgver}"
}

package() {
    cd "${srcdir}/grabit-${pkgver}"
    make install DESTDIR="${pkgdir}" PREFIX="/usr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 OPTIONS.md "${pkgdir}/usr/share/doc/${pkgname}/OPTIONS.md"
    install -Dm644 PLUGINS.md "${pkgdir}/usr/share/doc/${pkgname}/PLUGINS.md"
}
