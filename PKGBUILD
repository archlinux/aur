# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=ktextwidgets
pkgname=${_pkgname}-light
pkgver=5.38.0
pkgrel=1
pkgdesc="Advanced text editing widgets, light version without Text-to-Speech"
arch=('i686' 'x86_64')
url="https://community.kde.org/Frameworks"
license=('LGPL')
depends=('kcompletion' 'kservice' 'kiconthemes' 'sonnet')
makedepends=('extra-cmake-modules' 'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
groups=('kf5')
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz"{,.sig})
sha256sums=('eef0847aa98489437784361a281a16cbd52b3ac8a1a83619c370078e96ea1288' 'SKIP')
validpgpkeys=('53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB') # David Faure <faure@kde.org>

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../${_pkgname}-${pkgver} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DKDE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF \
        -DQt5TextToSpeech_FOUND=OFF
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
