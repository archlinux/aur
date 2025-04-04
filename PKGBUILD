# Maintainer: leejuyuu <leejuyuu at gmail dot com>

pkgname=spectral-cli
pkgver=6.14.3
pkgrel=1
pkgdesc='JSON/YAML linter with custom rulesets'
arch=('any')
url='https://github.com/stoplightio/spectral'
license=('Apache-2.0')
depends=('nodejs' 'bash')
makedepends=('npm')
_npmscope=@stoplight
source=("http://registry.npmjs.org/${_npmscope}/${pkgname}/-/${pkgname}-${pkgver}.tgz")
b2sums=('bdfbfa73c76066f18fca9542df7ae52759e765a9e82c7eb534bbc6fa74e087dc84121a9c550a8f489ecde6074cde18bc5c2ccc630acb4dfd2d06129d0fa61d6a')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
    npm install --global --omit dev --prefix "${pkgdir}/usr" "${pkgname}-${pkgver}.tgz"

    # -> https://wiki.archlinux.org/index.php/Node.js_package_guidelines
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
