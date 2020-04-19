# Maintainer: Emily Maré (emileet) <emileet@plsnobully.me>

pkgname=obs-ndi-git
_pkgname=obs-ndi
pkgver=r461.1854143
pkgrel=1
pkgdesc="Network A/V in OBS Studio with NewTek's NDI technology"
arch=('x86_64')
license=('GPL2')
url="https://github.com/Palakis/${_pkgname}"
provides=('obs-ndi')
conflicts=('obs-ndi' 'obs-ndi-bin')
depends=('avahi' 'ndi-sdk' 'obs-studio')
makedepends=('git' 'cmake')
source=("git+https://github.com/Palakis/obs-ndi.git"
        "git+https://github.com/obsproject/obs-studio.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/${_pkgname}

    cmake -B build -DLIBOBS_INCLUDE_DIR=${srcdir}/obs-studio/libobs -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd ${srcdir}/${_pkgname}/build
    make DESTDIR=${pkgdir} install

    install -Dm644 ../LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
