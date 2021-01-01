# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: shmilee <shmilee dot zju at gmail dot com>
#
_name="hexo"
pkgname="nodejs-${_name}"
pkgver="5.3.0"
pkgrel="1"
pkgdesc="A fast, simple & powerful blog framework, powered by Node.js."
arch=('any')
url="https://hexo.io"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
conflicts=('nodejs-hexo-cli')
options=(!strip)
source=("${_name}-${pkgver}.tar.gz::https://github.com/hexojs/hexo/archive/${pkgver}.tar.gz")
sha256sums=('8bdeef121e12d1bc87001ccd701f99aa25a550703b226c57e7d1e9554cd6e477')

# Don't extract package
noextract=('${pkgver}.tar.gz')

package() {
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    install -dm755 "${_npmdir}"
    cd "${_npmdir}"
    npm install --user root -g --prefix "${pkgdir}/usr" ${_name}@${pkgver}

    # License
    cd "${_npmdir}/hexo"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
