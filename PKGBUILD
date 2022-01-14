# Maintainer: taotieren <admin@taotieren.com>

pkgname=flashmq
_pkgname=FlashMQ
pkgver=0.9.6
pkgrel=1
pkgdesc="FlashMQ is a light-weight MQTT broker/server, designed to take good advantage of multi-CPU environments"
arch=('any')
url="https://github.com/halfgaar/FlashMQ"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
#replaces=(${pkgname})
depends=()
makedepends=('cmake' 'ninja')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${_pkgname}-${pkgver}.tar.gz::https://ghproxy.com/${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6cf03a9347a25fd5cccac5656a03e5c744d5e66ff059522f1ecfd26c50f38e9e')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    cmake -B build -G Ninja
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${_pkgname}-${pkgver}/build install
}
