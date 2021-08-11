# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_gemname=thor
pkgname="ruby-${_gemname}-0.20"
pkgver=0.20.3
pkgrel=1
pkgdesc='Toolkit for building powerful command-line interfaces (version 0.20.x)'
arch=('any')
url='http://whatisthor.com/'
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('49bc217fe28f6af34c6e60b003e3405c27595a55689077d82e9e61d4d3b519fa')

package() {
    local _gemdir
    _gemdir="$(ruby -e 'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
    rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "../../..${_gemdir#/usr}/gems/${_gemname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    mv "${pkgdir}/usr/bin"/${_gemname}{,"-${pkgver%.*}"}
}
