# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=parabolic-qt
_name="${pkgname%-qt}"
pkgver=2025.6.0
pkgrel=1
pkgdesc="Download web video and audio (Qt)"
arch=('x86_64')
url="https://github.com/NickvisionApps/Parabolic"
license=('MIT')
depends=('aria2'
         'bash'
         'boost-libs'
         'curl'
         'ffmpeg'
         'gcc-libs'
         'glib2'
         'glibc'
         'hicolor-icon-theme'
         'libsecret'
         'openssl'
         'qt6-base'
         'qt6-svg'
         'yt-dlp')
makedepends=('boost'
             'cmake'
             'desktop-file-utils'
             'libnick'
             'qlementine'
             'qlementine-icons'
             'yelp-tools')
provides=('tube-converter')
conflicts=('tube-converter')
replaces=('tube-converter')
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a2715fc437335fe633fc227fd2ab1da76eae098a7ab9dfc35ef7a53f4d6cf7d3')

build() {
    cmake -B build -S "${_name^}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUI_PLATFORM=qt \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${_name^}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
