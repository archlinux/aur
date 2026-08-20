# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=jj-bond
pkgver=0.1.5
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
sha256sums=('651eb6ed8efbe33519bff819c5a777669a946aa29acf7e22b09e92673fe52209')
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
