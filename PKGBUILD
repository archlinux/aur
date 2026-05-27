# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=plasma6-applets-application-widget
pkgver=0.1.0
pkgrel=1
pkgdesc='Run applications as Plasma widgets'
arch=('any')
url='https://github.com/luisbocanegra/plasma-application-widget'
license=('GPL-3.0-only')
depends=('plasma-desktop' 'qt6-wayland')
makedepends=('cmake' 'extra-cmake-modules' 'ki18n')
provides=('plasma-application-widget')
conflicts=('plasma-application-widget')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1548cb292a1fba869d53cae6ab06b0fb8e5b7110bd751b0d7a594cfd27be1300')

latestver() {
    gh api --paginate repos/luisbocanegra/plasma-application-widget/tags --jq '.[].name' |
        sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

build() {
    cmake -B build -S plasma-application-widget-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
