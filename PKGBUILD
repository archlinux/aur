# Maintainer: Ranadeep B < mail at rnbguy dot at >

pkgname=quint
orgname=informalsystems
pkgver=0.9.1
pkgrel=1
pkgdesc="Quint is an executable specification language with design and tooling focused on usability. It is based on the Temporal Logic of Actions"
arch=('any')
url="https://github.com/${orgname}/${pkgname}"
license=('Apache')
provides=(${pkgname})
conflicts=(${pkgname})
depends=('nodejs')
makedepends=('npm')
source=("https://github.com/${orgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1cf226160452dcacbc2dd8e0cff92ce8eb13a7d4f1eabfc33332a4c508bf6951')

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
