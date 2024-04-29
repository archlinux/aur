# Maintainer: leejuyuu <leejuyuu at gmail dot com>

pkgname=spectral-cli
pkgver=6.11.1
pkgrel=1
pkgdesc='JSON/YAML linter with custom rulesets'
arch=('any')
url='https://github.com/stoplightio/spectral'
license=('Apache-2.0')
depends=('nodejs' 'bash')
makedepends=('npm')
_npmscope=@stoplight
source=("http://registry.npmjs.org/${_npmscope}/${pkgname}/-/${pkgname}-${pkgver}.tgz")
b2sums=('32eff4ffd6fd37881311bf00c3423ced27afe329f4ee3e084d0e447d228a8e118513876c21b13725850d522908bc5330d3ee876583fccf0a38323703c2ea6483')
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
