# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=hadolint
pkgver=2.6.1
pkgrel=1
pkgdesc='Dockerfile linter, validate inline bash, written in Haskell'
url='https://github.com/hadolint/hadolint/'
arch=('x86_64')
license=('GPL')
depends=('gmp')
makedepends=('stack')
conflicts=('hadolint-bin' 'hadolint-git')
source=("https://github.com/hadolint/hadolint/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3a9a03b1b0277cc763c67179676b8b8aa29503db6db6cb7739c2d3ca9536921a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    stack build hadolint --flag hadolint:-static
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 \
        .stack-work/install/*/*/*/bin/hadolint \
        "${pkgdir}/usr/bin/hadolint"
}

