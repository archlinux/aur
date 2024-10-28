# Maintainer: Emily Maré (emileet) <emileet@plsnobully.me>

_pkgname=DistroAV
pkgname=distroav
pkgver=6.0.0
pkgrel=1
pkgdesc="NDI integration for OBS Studio"
arch=('x86_64')
license=('GPL2')
url="https://github.com/DistroAV/DistroAV"
provides=('obs-ndi' 'distroav')
conflicts=('obs-ndi-bin' 'obs-ndi-git' 'distroav-git')
depends=('avahi' 'libndi' 'obs-studio' 'sndio')
makedepends=('cmake')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('413d92d663dc58b38b450fc9588ded92c80076180b3628f824e2b53cbbc1cbaa')

build() {
    cd ${_pkgname}-${pkgver}

    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_FRONTEND_API=ON -DENABLE_QT=ON --compile-no-warning-as-error
    cmake --build build
}

package() {
    cd ${_pkgname}-${pkgver}

    install -Dm755 build/${pkgname}.so ${pkgdir}/usr/lib/obs-plugins/${pkgname}.so

    install -d ${pkgdir}/usr/share/obs/obs-plugins/${pkgname}/locale
    cp -a data/locale/* ${pkgdir}/usr/share/obs/obs-plugins/${pkgname}/locale

    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
