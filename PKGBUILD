# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_gemname=ceedling
pkgname="ruby-${_gemname}"
pkgver=0.31.1
pkgrel=1
pkgdesc='Build system for C projects'
arch=('any')
url='https://www.throwtheswitch.org/ceedling/'
license=('BSD')
depends=('ruby' 'ruby-constructor' 'ruby-deep_merge' 'ruby-rake' 'ruby-thor-0.20')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('31af51affce247d603488884a2ac9fc61d9c51307377950943bba0d748f85bca')

package() {
    local _gemdir
    _gemdir="$(ruby -e 'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
    rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "../../..${_gemdir#/usr}/gems/${_gemname}-${pkgver}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
