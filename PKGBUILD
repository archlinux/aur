# Maintainer: Qingxu <me@linioi.com>

pkgname=yamlresume
pkgver=0.12.3
pkgrel=1
pkgdesc="Resumes as code in YAML"
arch=('any')
url="https://github.com/yamlresume/yamlresume"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('cabc5a4b1803ef2be2187592f5db8958281ea3f109b2f8b34cac9d26be8eaa0b')
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
