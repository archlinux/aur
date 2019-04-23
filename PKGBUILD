# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=scrumplexweb
pkgver=19.04.5
pkgrel=1
pkgdesc="Static website of Sefa Eyeoglu"
arch=("any")
url="https://scrumplex.net"
license=("GPL")
makedepends=("nodejs-pnpm")

source=("https://gitlab.com/Scrumplex/scrumplex.net/-/archive/${pkgver}/scrumplex.net-${pkgver}.tar.bz2")
# automatically generated with updpkgsums
sha512sums=('66ed74b2c43be765a0474f512653a66f74c83170d112e33e2a556dab9613f5aa047018c8989dca35df668c15e80e5a53ecd059bbd717112963b5a507ed49ca24')

prepare() {
    cd "${srcdir}/scrumplex.net-${pkgver}"
    pnpm install --cache "${srcdir}/npm-cache"
}

build() {
    cd "${srcdir}/scrumplex.net-${pkgver}"
    npm run build:prod --cache "${srcdir}/npm-cache"
}

package() {
    find "${srcdir}/scrumplex.net-${pkgver}/public" -type f -exec install -Dm 644 -t "${pkgdir}/usr/share/webapps/scrumplexweb" "{}" \;
}
