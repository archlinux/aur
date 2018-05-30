# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=imdb-rename
pkgver=0.1.0
pkgrel=1
makedepends=('rust' 'cargo')
depends=('openssl')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A command line utility for searching IMDb and renaming your media files."
url="https://github.com/BurntSushi/imdb-rename"
license=('Unlicense/MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BurntSushi/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('54cbc5db14dea8c84a9e1285b5cad0d7752d8a20577c40aabbf2192998132d6a2ec556b50ee99c9822f7e517736083aebf56809ecb90dfe1bd7100da03fe9dc9')


build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    # make sure both binaries are built
    cargo build --release --all
}


package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    # install the binaries
    install -Dm755 "target/release/imdb-rename" "${pkgdir}/usr/bin/imdb-rename"
    install -Dm755 "target/release/imdb-eval" "${pkgdir}/usr/bin/imdb-eval"

    # licenses and documentation
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 "UNLICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
}
