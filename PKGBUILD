# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=imdb-rename-git
_pkgname=imdb-rename
pkgver=0.1.0.r9.g3c4e327
pkgrel=1
makedepends=('rust' 'cargo' 'git')
depends=('openssl')
conflicts=('imdb-rename')
provides=('imdb-rename')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc='A command line utility for searching IMDb and renaming your media files.'
url='https://github.com/BurntSushi/imdb-rename'
license=('Unlicense/MIT')
source=("${pkgname}::git+https://github.com/BurntSushi/${_pkgname}")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}/"

    # make sure both binaries are built
    cargo build --release --all
}


package() {
    cd "${srcdir}/${pkgname}/"

    # install the binaries
    install -Dm755 "target/release/imdb-rename" "${pkgdir}/usr/bin/imdb-rename"
    install -Dm755 "target/release/imdb-eval" "${pkgdir}/usr/bin/imdb-eval"

    # licenses and documentation
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 "UNLICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
}
