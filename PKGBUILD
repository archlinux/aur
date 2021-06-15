# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=hadolint
pkgver=2.5.0
pkgrel=1
pkgdesc='Dockerfile linter, validate inline bash, written in Haskell'
url='https://github.com/hadolint/hadolint/'
arch=('x86_64')
license=('GPL')
depends=('gmp')
makedepends=('stack')
conflicts=('hadolint-bin' 'hadolint-git')
source=("https://github.com/hadolint/hadolint/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0de36f1fa8f86183d51722cda142dd41039aab557b4e8d0bfc6f5fe265bf9fa1')

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

