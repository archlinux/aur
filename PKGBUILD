# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Martino Pilia <martino.pilia@gmail.com>
pkgname=hadolint
pkgver=2.15.1
pkgrel=1
pkgdesc='Dockerfile linter, validate inline bash, written in Haskell'
url='https://github.com/hadolint/hadolint/'
arch=('x86_64')
license=('GPL-3.0-only')
depends=('gmp')
makedepends=('stack')
conflicts=('hadolint-bin' 'hadolint-git')
source=(
    "https://hackage.haskell.org/packages/archive/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz"
    "stack.yaml"
)
sha256sums=('53a210184be82bd273fb298c0887a84e7d6c1d08fcdfc376373235c0c786bb27'
            'fa3f37928916ca63f95065a3fc2cc9743e9c04e43944c7ed77fb429a1a758297')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # NOTE: the official build of hadolint switched from stack to cabal.
    # However, it requires ghc>=9.10.x, while the version of ghc
    # currently available on Arch is 9.4.8.
    # For this reason, the package keeps using stack for now.
    cp "${srcdir}/stack.yaml" .

    stack build hadolint
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 \
        .stack-work/install/*/*/*/bin/hadolint \
        "${pkgdir}/usr/bin/hadolint"
}
