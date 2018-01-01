# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=nodejs-ts-node
pkgver=4.1.0
pkgrel=1
pkgdesc='TypeScript execution environment and REPL for node'
arch=('any')
url='https://github.com/TypeStrong/ts-node'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=(!emptydirs)

package() {
    npm install --user root -g --prefix="${pkgdir}"/usr ts-node@${pkgver}

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s ../../../lib/node_modules/ts-node/LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}"

    find "${pkgdir}" -name "package.json" -exec sed -e "s|${pkgdir}||" -i {} \;
    sed -e "s|${srcdir}|/|" \
        -i "${pkgdir}"/usr/lib/node_modules/ts-node/package.json
}
