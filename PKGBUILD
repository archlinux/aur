# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=jj-bond
pkgver=0.1.8
pkgrel=1
pkgdesc="jujutsu TUI"
arch=('any')
url="https://github.com/TD-Sky/jj-bond"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}-bin")
depends=('jujutsu')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('12d15d48fe69d9d28c673baac1ae0eec03f932b9761a74df0e5ea073fa96786c')
options=(!strip !lto !debug)

prepare() {
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --frozen
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm 755 target/release/jb -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
