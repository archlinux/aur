# Maintainer: Emily Maré (emileet) <emileet@plsnobully.me>

pkgname=obs-ndi
pkgver=4.13.0
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('45331b1517a428e920e0d35d7a673ba4210ba9d045ae9e38318a6b3be2eff7f9')

build() {
    cd ${pkgname}-${pkgver}

    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_FRONTEND_API=ON -DENABLE_QT=ON
    cmake --build build
}

package() {
    cd ${pkgname}-${pkgver}

    install -Dm755 build/obs-ndi.so ${pkgdir}/usr/lib/obs-plugins/obs-ndi.so

    install -d ${pkgdir}/usr/share/obs/obs-plugins/obs-ndi/locale
    cp -a data/locale/* ${pkgdir}/usr/share/obs/obs-plugins/obs-ndi/locale

    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
