# Maintainer: Mikael Blomstrand <gmail: kmbloms>

pkgname=svgbob-git
pkgver=0.5.0alpha.8.r389.503f303
pkgrel=1
pkgdesc='Convert your ascii diagram scribbles into happy little SVG'
arch=('i686' 'x86_64')
url="https://github.com/ivanceras/svgbob"
license=('Apache')
depends=('gcc-libs')
conflicts=('svgbob')
provides=('svgbob')
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/ivanceras/svgbob.git")
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/svgbob"
    printf "%s.r%s.%s" "$(grep '^version = ' svgbob_cli/Cargo.toml | sed -e "s/version = \"//" -e "s/\"//" -e "s/-//")"\
                       "$(git rev-list --count HEAD)"\
                       "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/svgbob/svgbob_cli"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/svgbob/target/release/svgbob" "${pkgdir}/usr/bin/svgbob"
  install -Dm644 "${srcdir}/svgbob/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
