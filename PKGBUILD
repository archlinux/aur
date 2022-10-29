# Maintainer: Emily Maré (emileet) <emileet@plsnobully.me>

pkgname=obs-ndi
pkgver=4.10.0
pkgrel=1
pkgdesc="Network A/V in OBS Studio with NewTek's NDI technology"
arch=('x86_64')
license=('GPL2')
url="https://github.com/Palakis/obs-ndi"
provides=('obs-ndi')
conflicts=('obs-ndi-bin' 'obs-ndi-git')
depends=('avahi' 'libndi' 'obs-studio' 'sndio')
makedepends=('cmake')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/dummy-tag-4.10.0.tar.gz")
sha256sums=('4c617c80aa5438ce5d2166f8b83a3ddb309f17a02b861da162a6ec481cd42a18')

build() {
    cd ${pkgname}-dummy-tag-${pkgver}

    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd ${pkgname}-dummy-tag-${pkgver}/build

    install -Dm755 obs-ndi.so ${pkgdir}/usr/lib/obs-plugins/obs-ndi.so
    install -Dm644 ../data/locale/en-US.ini ${pkgdir}/usr/share/obs/obs-plugins/obs-ndi/locale/en-US.ini

    install -Dm644 ../LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
