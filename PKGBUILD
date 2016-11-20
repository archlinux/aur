# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=sunxi-disp-tool
pkgver=0.0.4
pkgrel=1
pkgdesc='Userspace utility to set sunxi disp2 HDMI resolution via ioctl'
arch=('aarch64')
url='https://github.com/longsleep/sunxi-disp-tool'
license=('BSD')
makedepends=('go')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/longsleep/${pkgname}/archive/ubuntu/xenial/${pkgver}.tar.gz")
md5sums=('44c4de8ba58c575dca2b63f5bbfd854d')

prepare() {
    cd ${pkgname}-ubuntu-xenial-${pkgver}
    sed -i 's|github.com/longsleep/sunxi-disp-tool/|./|' disp.go
    sed -i 's|github.com/longsleep/sunxi-disp-tool/|.././|' */*.go
}

build() {
    export GOPATH="${srcdir}/${pkgname}-ubuntu-xenial-${pkgver}"
    cd ${pkgname}-ubuntu-xenial-${pkgver}
    go build -o "target/${pkgname}"
}

package() {
    cd ${pkgname}-ubuntu-xenial-${pkgver}
    install -Dm755 "target/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 debian/${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
