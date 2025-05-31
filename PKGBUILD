# Maintainer: leejuyuu <leejuyuu at gmail dot com>

pkgname=spectral-cli
pkgver=6.15.0
pkgrel=1
pkgdesc='JSON/YAML linter with custom rulesets'
arch=('any')
url='https://github.com/stoplightio/spectral'
license=('Apache-2.0')
depends=('nodejs' 'bash')
makedepends=('npm')
_npmscope=@stoplight
source=("http://registry.npmjs.org/${_npmscope}/${pkgname}/-/${pkgname}-${pkgver}.tgz")
b2sums=('599647edeb95bdfa4a8582fc695e59a13a79006a53c4100911917e15626480941df43fce317ed539cd0780ebafcc163ceaedd8b1025ca464745254d2860fcffd')
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
