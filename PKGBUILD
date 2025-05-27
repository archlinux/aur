# Contributor: Integral <integral@murena.io>
# Maintainer: Kazel <address at domain dot tld>

pkgname=klevernotes
pkgver=1.2.2
pkgrel=2
pkgdesc="A convergent markdown note taking application"

url="https://invent.kde.org/office/klevernotes"
arch=('x86_64')
license=('GPL-3.0-or-later')
options=('!lto' '!debug')

groups=('kde-applications-git' 'kde-utilities-git')
depends=('kio' 'qt6-webengine')
makedepends=('extra-cmake-modules')

source=("https://invent.kde.org/office/klevernotes/-/archive/v${pkgver}/klevernotes-v${pkgver}.tar.gz")
sha512sums=('SKIP')


build() {
    cmake -B build/ -S ${pkgname}-v${pkgver} -DBUILD_TESTING=OFF
    cmake --build build/
}

package() {
    # Application
    DESTDIR="${pkgdir}/" cmake --install build/

    # Licenses
    install -Dm644 ${srcdir}/${pkgname}-v${pkgver}/LICENSES/* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
