# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=whitebox-tools
pkgver=2.0.0
pkgrel=1
pkgdesc="WhiteboxTools is an advanced geospatial data analysis platform developed by Prof. John Lindsay"
arch=(i686 x86_64)
url="https://www.whiteboxgeo.com/"
license=('MIT')
makedepends=('rust')
depends=('python')
source=("https://github.com/jblindsay/whitebox-tools/archive/v${pkgver}.tar.gz")
sha256sums=('18705fc948bdb2f96cd816e5a72d36b9cc460aa8c910383d23fdbd61641aab60')


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
