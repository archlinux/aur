# Contributor: Integral <integral@murena.io>
# Maintainer: Kazel <address at domain dot tld>

pkgname=klevernotes
pkgver=1.1.0
pkgrel=1
pkgdesc="A convergent markdown note taking application"

url="https://invent.kde.org/office/klevernotes"
arch=('x86_64')
license=('GPL' 'LGPL' 'BSD')
options=('!lto' '!debug')

groups=('kde-applications-git' 'kde-utilities-git')
depends=('kio' 'qt6-webengine')
makedepends=('extra-cmake-modules')

source=("https://invent.kde.org/office/klevernotes/-/archive/v${pkgver}/klevernotes-v${pkgver}.tar.gz")
sha512sums=('SKIP')

prepare() {
    install -d build/
}

build() {
    cd build/
    cmake -B build/ -S ../${pkgname}-v${pkgver} -DBUILD_TESTING=OFF
    cmake --build build/
}

package() {
    cd build/
    DESTDIR="${pkgdir}/" cmake --install build/

    # Licenses
    install -Dm644 ${srcdir}/${pkgname}-v${pkgver}/LICENSES/* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
