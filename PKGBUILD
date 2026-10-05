# Maintainer: Qingxu <me@linioi.com>

pkgname=yamlresume
pkgver=0.16.2
pkgrel=1
pkgdesc="Resumes as code in YAML"
arch=('any')
url="https://github.com/yamlresume/yamlresume"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('2581881b1bfc811fa8fc9c15f8d35210777bea2905c20afe25c3e55d49b8c1ca')
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
