# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: shmilee <shmilee dot zju at gmail dot com>
#
_name="hexo"
pkgname="nodejs-${_name}"
pkgver="4.2.0"
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
sha256sums=('8d1c3dfb8593b11d0f664860255cd4f047dd81d07d815371bf48f59bbc7494ec')

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
