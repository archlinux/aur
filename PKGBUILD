# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: shmilee <shmilee dot zju at gmail dot com>
#
_name="hexo"
pkgname="nodejs-${_name}"
pkgver="3.9.0"
pkgrel="1"
pkgdesc="A fast, simple & powerful blog framework, powered by Node.js."
arch=('any')
url="https://hexo.io"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
conflicts=('nodejs-hexo-cli')
options=(!strip)
source=(https://github.com/hexojs/hexo/archive/${pkgver}.tar.gz)
sha256sums=('3ee49f85a404f508c34f6fc65996989287ed23972dad89427a93ceb744515ee1')

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

# vim:set ts=4 sw=4 ft=sh et syn=sh:
