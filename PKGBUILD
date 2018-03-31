# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: shmilee <shmilee dot zju at gmail dot com>
#
_name="hexo"
pkgname="nodejs-${_name}"
pkgver="3.7.0"
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
sha256sums=('cee65c1800e7fa486e032c64848eb9e6dda7db76a67c60a9bc6ff875b64689aa')

# Don't extract package
noextract=('${pkgver}.tar.gz')

package() {
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    install -dm755 "${_npmdir}"
    cd "${_npmdir}"
    npm install --user root -g --prefix "${pkgdir}/usr" ${_name}@${pkgver}
  
    cd "${pkgdir}"
    rm -r ./usr/etc
    
    # License
    cd "${_npmdir}/hexo"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}

# vim:set ts=4 sw=2 ft=sh et syn=sh ft=sh:
