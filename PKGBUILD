# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_gemname=constructor
pkgname="ruby-${_gemname}"
pkgver=2.0.0
pkgrel=1
pkgdesc='Declarative named-argument object initialization'
arch=('any')
url='https://github.com/atomicobject/constructor/'
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('3e2184496074926f5afa396f5d4377dce99a26f3a5763afe6c256e3611b8150b')

package() {
    local _gemdir
    _gemdir="$(ruby -e 'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
    rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    sed -n '/==[[:space:]]LICENSE:/,$p' "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/README.rdoc" \
        > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
