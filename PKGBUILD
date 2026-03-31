# Maintainer: Qingxu <me@linioi.com>

pkgname=yamlresume
pkgver=0.12.2
pkgrel=1
pkgdesc="Resumes as code in YAML"
arch=('any')
url="https://github.com/yamlresume/yamlresume"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('17e8c6e63671f26af7e70145a5f19af4aafd620433675af7b793e7ec340f92c4')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
    npm install -g \
        --cache "${srcdir}/npm-cache" \
        --prefix "${pkgdir}/usr" \
        "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Fix permissions
    chmod -R go-w "${pkgdir}/usr"

    # Remove references to $pkgdir
    find "${pkgdir}" -name 'package.json' -exec sed -i "s|${pkgdir}||g" {} \;

    # Install license
    install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
