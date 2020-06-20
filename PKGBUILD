# Maintainer: Emily Maré (emileet) <emileet@plsnobully.me>

pkgname=obs-ndi-git
_pkgname=obs-ndi
pkgver=4.9.1.r1.g9f96d80
pkgrel=1
pkgdesc="Network A/V in OBS Studio with NewTek's NDI technology"
arch=('x86_64')
license=('GPL2')
url="https://github.com/Palakis/obs-ndi"
provides=('obs-ndi')
conflicts=('obs-ndi-bin')
depends=('avahi' 'libndi' 'obs-studio-git')
makedepends=('git' 'cmake')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${_pkgname}

    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd ${_pkgname}/build
    make DESTDIR=${pkgdir} install

    install -Dm644 ../LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
