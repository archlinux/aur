# Maintainer: taotieren <admin@taotieren.com>

pkgname=flashmq-git
pkgver=0.9.6.r1.g3746e3d
pkgrel=1
pkgdesc="FlashMQ is a light-weight MQTT broker/server, designed to take good advantage of multi-CPU environments"
arch=('any')
url="https://github.com/halfgaar/FlashMQ"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-git})
#replaces=(${pkgname})
depends=()
makedepends=('git' 'cmake' 'ninja')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname%-git}::git+https://ghproxy.com/${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}/"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}/"
    cmake -B build -G Ninja
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname%-git}/build install
}
