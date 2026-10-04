# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=soapyiqfile-git
_pkgname=SoapyIQFile
pkgver=r13.4d82f81
pkgrel=1
pkgdesc="SoapySDR module that replays IQ data (CF32) from a file or FIFO pipe"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/utn-ba-rf-lab/SoapyIQFile"
license=('GPL-3.0-only')
depends=('soapysdr')
provides=('soapyiqfile')
conflicts=('soapyiqfile')
makedepends=('cmake' 'git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_pkgname}"
    cmake -B build \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build build
}

package() {
    cd "$srcdir/${_pkgname}"
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
