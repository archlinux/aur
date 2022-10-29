# Maintainer: Emily Maré (emileet) <emileet@plsnobully.me>

pkgname=obs-ndi-git
_pkgname=obs-ndi
pkgver=r59.81a1612
pkgrel=1
pkgdesc="Network A/V in OBS Studio with NewTek's NDI technology"
arch=('x86_64')
license=('GPL2')
url="https://github.com/Palakis/obs-ndi"
provides=('obs-ndi')
conflicts=('obs-ndi-bin')
depends=('avahi' 'libndi' 'obs-studio' 'sndio')
makedepends=('git' 'cmake')
install="${_pkgname}.install"
source=("git+${url}.git#branch=rewrite")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${_pkgname}
}

build() {
    cd ${_pkgname}

    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd ${_pkgname}/build

    install -Dm755 obs-ndi.so ${pkgdir}/usr/lib/obs-plugins/obs-ndi.so
    install -Dm644 ../data/locale/en-US.ini ${pkgdir}/usr/share/obs/obs-plugins/obs-ndi/locale/en-US.ini

    install -Dm644 ../LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
