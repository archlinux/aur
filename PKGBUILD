# Maintainer: Márton Szabó < echo "bm90cmFtb0B2aXBtYWlsLmh1Cg=="|base64 -d >

pkgname=tokei-git
pkgver=v7.0.1.r17.16d49fc
pkgrel=1
pkgdesc='A blazingly fast CLOC(Count Lines Of Code) program'
arch=('i686' 'x86_64')
url="https://github.com/Aaronepower/tokei"
license=('MIT' 'Apache')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
conflicts=('tokei')
source=("git+https://github.com/Aaronepower/tokei")
sha512sums=(SKIP)

pkgver() {
    cd "${srcdir}/tokei"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "${srcdir}/tokei"

    cargo build --release
}

package() {
    cd "${srcdir}/tokei"

    install -Dm755 target/release/tokei "${pkgdir}/usr/bin/tokei"

    install -Dm644 LICENCE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENCE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
