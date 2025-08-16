# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=parabolic
pkgver=2025.8.0
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
makedepends=('blueprint-compiler' 'boost' 'cmake' 'libmaddy' 'libnick' 'yelp-tools')
provides=('tube-converter')
conflicts=('tube-converter')
replaces=('tube-converter')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0bf4da852f6a3e3f5fd9714c9d16b2042d7d42597540ebb6007f2cbb7ff33eb8')

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
