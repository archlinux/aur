# Maintainer: Emily Maré (emileet) <emileet@plsnobully.me>

pkgname=obs-ndi
pkgver=4.9.1
pkgrel=2
pkgdesc="Network A/V in OBS Studio with NewTek's NDI technology"
arch=('x86_64')
license=('GPL2')
url="https://github.com/Palakis/obs-ndi"
provides=('obs-ndi')
conflicts=('obs-ndi-bin' 'obs-ndi-git')
depends=('avahi' 'libndi' 'obs-studio')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('25ada71fef14b23fa03a0a5bcce87e36161f4f2488f34aa256634e5973d8e66b')

build() {
    cd ${pkgname}-${pkgver}

    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd ${pkgname}-${pkgver}/build
    make DESTDIR=${pkgdir} install

    install -Dm644 ../LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
