# Maintainer: Emily Maré (emileet) <emileet@plsnobully.me>

_pkgname=DistroAV
pkgname=obs-ndi
pkgver=4.14.1
pkgrel=1
pkgdesc="Network A/V in OBS Studio with NewTek's NDI technology"
arch=('x86_64')
license=('GPL2')
url="https://github.com/DistroAV/DistroAV"
provides=('obs-ndi')
conflicts=('obs-ndi-bin' 'obs-ndi-git')
depends=('avahi' 'libndi' 'obs-studio' 'sndio')
makedepends=('cmake')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('ae0f4bdd66212e1d9315b2b42e2930d9ccec220f204703ff9ca0b7f34997b70d')

build() {
    cd ${_pkgname}-${pkgver}

    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_FRONTEND_API=ON -DENABLE_QT=ON
    cmake --build build
}

package() {
    cd ${_pkgname}-${pkgver}

    install -Dm755 build/obs-ndi.so ${pkgdir}/usr/lib/obs-plugins/obs-ndi.so

    install -d ${pkgdir}/usr/share/obs/obs-plugins/obs-ndi/locale
    cp -a data/locale/* ${pkgdir}/usr/share/obs/obs-plugins/obs-ndi/locale

    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
