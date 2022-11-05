# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=whitebox-tools
pkgver=2.2.0
pkgrel=1
pkgdesc="WhiteboxTools is an advanced geospatial data analysis platform developed by Prof. John Lindsay"
arch=(i686 x86_64)
url="https://www.whiteboxgeo.com/"
license=('MIT')
makedepends=('rust')
depends=('python')
source=("https://github.com/jblindsay/whitebox-tools/archive/v${pkgver}.tar.gz")
sha256sums=('b7715731e1519be71cf1d05d1d1f93c36d498c218da0a898bab95e16dd403a8e')

build() {
    cd "${pkgname}-${pkgver}"

    cargo clean 
    cargo build --release 
}

package() {
    cd "${pkgname}-${pkgver}"

    mkdir -p "${pkgdir}"/{usr/bin,usr/lib/python3.9/site-packages}
    install -D -m755 "target/release/whitebox_tools" "${pkgdir}/usr/bin/whitebox_tools"
    install -D -m755 "whitebox_tools.py" "${pkgdir}/usr/lib/python3.9/site-packages/whitebox_tools.py"
    install -D -m755 "wb_runner.py" "${pkgdir}/usr/lib/python3.9/site-packages/wb_runner.py"
}
