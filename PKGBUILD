# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=parabolic
pkgver=2025.7.2
pkgrel=1
pkgdesc="Download web video and audio"
arch=('x86_64')
url="https://github.com/NickvisionApps/Parabolic"
license=('MIT')
depends=('aria2'
         'bash'
         'boost-libs'
         'cpr'
         'ffmpeg'
         'gcc-libs'
         'glib2'
         'glibc'
         'gtk4'
         'hicolor-icon-theme'
         'libadwaita'
         'libsecret'
         'libxml++-5.0'
         'sqlcipher'
         'yt-dlp')
makedepends=('blueprint-compiler' 'boost' 'cmake' 'libnick' 'yelp-tools')
provides=('tube-converter')
conflicts=('tube-converter')
replaces=('tube-converter')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0559d6a86099ba91610e68e8b367d31f5d523a9649c8959f2aa68278d5de279b')

build() {
    cmake -B build -S "${pkgname^}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${pkgname^}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
