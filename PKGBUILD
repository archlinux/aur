# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=hadolint
pkgver=2.4.1
pkgrel=1
pkgdesc='Dockerfile linter, validate inline bash, written in Haskell'
url='https://github.com/hadolint/hadolint/'
arch=('x86_64')
license=('GPL')
depends=('gmp')
makedepends=('stack')
conflicts=('hadolint-bin' 'hadolint-git')
source=("https://github.com/hadolint/hadolint/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dade1c9659471b3aff220f0a321e98c45e24584c7bd0d5d20bd95c64a1269bdd')

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

