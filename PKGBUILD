# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgbase=parabolic
pkgname=(parabolic-gtk parabolic-qt)
pkgver=2024.12.2
pkgrel=1
pkgdesc="Download web video and audio"
arch=('x86_64')
url="https://github.com/NickvisionApps/Parabolic"
license=('MIT')
makedepends=('blueprint-compiler' 'boost' 'cmake' 'gtk4' 'libadwaita' 'libnick' 'libsecret' 'libxml++-5.0' 'qt6-base' 'qt6-svg')
provides=('tube-converter')
conflicts=('tube-converter')
replaces=('tube-converter')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e92787d6587c722a79a4ab58f4c6638a180fc26a93f0d77c18fe88f6a4556f3a')

build() {
    cmake -B build-gtk -S "${pkgbase^}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUI_PLATFORM=gnome \
        -Wno-dev
    cmake --build build-gtk

    cmake -B build-qt -S "${pkgbase^}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUI_PLATFORM=qt \
        -Wno-dev
    cmake --build build-qt
}

package_parabolic-gtk() {
    depends=('bash'
             'boost-libs'
             'curl'
             'gcc-libs'
             'glib2'
             'glibc'
             'gtk4'
             'hicolor-icon-theme'
             'libadwaita'
             'libsecret'
             'libxml++-5.0'
             'openssl')

    DESTDIR="${pkgdir}" cmake --install build-gtk
    install -Dm644 "${pkgbase^}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_parabolic-qt() {
    depends=('bash'
             'boost-libs'
             'curl'
             'gcc-libs'
             'glib2'
             'glibc'
             'hicolor-icon-theme'
             'libsecret'
             'openssl'
             'qt6-base')

    DESTDIR="${pkgdir}" cmake --install build-qt
    install -Dm644 "${pkgbase^}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
