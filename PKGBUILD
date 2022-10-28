# Maintainer: Bazyli Cyran <bazyli@cyran.dev>

pkgname=timewall
pkgver=0.2.0
pkgrel=1
pkgdesc='Apple dynamic HEIF wallpapers on GNU/Linux'
url='https://github.com/bcyran/timewall'
provides=('timewall')
conflicts=('timewall-bin')
depends=('libheif')
makedepends=('cargo')
checkdepends=('cargo')
license=('MIT')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bcyran/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('51b6264299acbc35c8872a58424efc743233d614039f5075743fa19cbb1e776f')

build() {
    cd "${pkgname}-${pkgver}"
    export SHELL_COMPLETIONS_DIR="completions"
    mkdir -p "${SHELL_COMPLETIONS_DIR}"
    cargo build --release --locked
}

check() {
    cd "${pkgname}-${pkgver}"
    cargo test --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm 644 "completions/${pkgname}.bash" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm 644 "completions/_${pkgname}" -t "${pkgdir}/usr/share/zsh/site-functions"
    install -Dm 644 "completions/${pkgname}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
}
