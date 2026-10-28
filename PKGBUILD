# Maintainer: Bertrand Bonnefoy-Claudet <bertrand@bertrandbc.com>

pkgname=ruby-andand
_gemname=${pkgname#ruby-}
pkgver=1.3.3
pkgrel=4
pkgdesc="Maybe Monad in idiomatic Ruby"
arch=('any')
url="https://github.com/raganwald/andand"
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('483d8a01e0d02dfc55de7759527d20c167edf0607983fc4e50a7c3583709346c')

package() {
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install --no-document \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" \
    "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  install -Dm 644 "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/License.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
