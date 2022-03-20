# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=hadolint
pkgver=2.9.2
pkgrel=1
pkgdesc='Dockerfile linter, validate inline bash, written in Haskell'
url='https://github.com/hadolint/hadolint/'
arch=('x86_64')
license=('GPL')
depends=('gmp')
makedepends=('stack')
conflicts=('hadolint-bin' 'hadolint-git')
source=("https://github.com/hadolint/hadolint/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('de789a2fb4d92d927e8e126fb54fec9dd2b58baf05d7aa7843cf5347428bb543')

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

