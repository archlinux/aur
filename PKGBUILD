# Contributor: Poscat <poscat@mail.poscat.moe>

pkgname=tinyfecvpn
pkgver=20230206.0
pkgrel=1
pkgdesc="A Lightweight VPN with Build-in Forward Error Correction Support"
arch=('x86_64')
url="https://github.com/wangyu-/tinyfecVPN"
license=('MIT')
makedepends=('git')
source=("git+https://github.com/wangyu-/tinyfecvpn.git#tag=${pkgver}"
        "git+https://github.com/wangyu-/UDPspeeder.git")
sha256sums=('fa08b72f2498f51efbdc2d3d4d0be40491aaa99a23afe795798c2b8323db8717'
            'SKIP')

prepare() {
    cd "${pkgname}"
    git submodule init
    git config submodule.UDPspeeder.url "$srcdir/UDPspeeder"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "${pkgname}"
    make nolimit 
}

package() {
    cd "${pkgname}"
    install -D -m 755 tinyvpn "${pkgdir}/usr/bin/tinyvpn"
    install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
