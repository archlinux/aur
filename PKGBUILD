# Maintainer: Jens Kabisch <jenskabi@gmail.com>
pkgname=yesbotics-serial-monitor
pkgver=0.1.1
pkgrel=1
pkgdesc='A fast and lightweight serial monitor with some helping functions to work with the Yesbotics Simple Serial Protocol.'
arch=('1686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/yesbotics/yesbotics-serial-monitor'
license=('MIT')
makedepends=('go>=1.21.5' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f800511403748412b62d14885f1276ad9b8e8fc31515003982416ef07868c4c8')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o ysm -ldflags "-extldflags \"${LDFLAGS}\" -s -w -X main.version=${pkgver}" main.go
}

package() {
    install -Dm755 "${pkgname}-${pkgver}/ysm" ${pkgdir}/usr/bin/ysm
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
