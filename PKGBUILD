# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=jj-bond
pkgver=0.1.3
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
sha256sums=('e4d2a11eff1c400320fbb401b9e78783efcd27d5c0d60702690ca45c4290dca7')
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
