# Maintainer: leejuyuu <leejuyuu at gmail dot com>

pkgname=spectral-cli
pkgver=6.14.0
pkgrel=1
pkgdesc='JSON/YAML linter with custom rulesets'
arch=('any')
url='https://github.com/stoplightio/spectral'
license=('Apache-2.0')
depends=('nodejs' 'bash')
makedepends=('npm')
_npmscope=@stoplight
source=("http://registry.npmjs.org/${_npmscope}/${pkgname}/-/${pkgname}-${pkgver}.tgz")
b2sums=('6a205f417bf083d2210f6de08f12359ae80c4d9d11e95126f561544b95145c5757bac14bcf3ec66968d8e7cdfe03039c175436ee5f79a7537f2e625e478e58c0')
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
