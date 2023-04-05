# Maintainer: Ranadeep B < mail at rnbguy dot at >

pkgname=quint
orgname=informalsystems
pkgver=0.9.0
pkgrel=1
pkgdesc="Quint is an executable specification language with design and tooling focused on usability. It is based on the Temporal Logic of Actions"
arch=('any')
url="https://github.com/${orgname}/${pkgname}"
license=('Apache')
provides=(${pkgname})
conflicts=(${pkgname})
depends=('nodejs')
makedepends=('npm' 'git')
source=("https://github.com/${orgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c9b3a077e43bf8959ba26c1498fdb5d5e9caa7fefcd6ba2b157579858cf57bba')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
    npm install
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
    npm run compile
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
    npm pack
    npm install -g --prefix "${pkgdir}/usr" --no-save "${orgname}-${pkgname}-${pkgver}.tgz"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
