pkgname=cmd-wrapped
pkgver=0.2.0
pkgrel=1
pkgdesc="Find out what the past year looks like in command line!"
arch=('any')
url="https://github.com/YiNNx/${pkgname}"
license=('MIT')
depends=("gcc-libs" "glibc")
makedepends=("rust")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('06f21be755a0a0b362472bbe565391c26056d27aeed6ca81457a9b7977f553e6')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 License "${pkgdir}/usr/share/license/${pkgname}/LICENSE"
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" *.md
}
