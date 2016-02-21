# Maintainer: Severen Redwood <severen@shrike.me>
# Report all package issues to `https://github.com/SShrike/pkgbuilds`

_gemname='tzinfo'
pkgname="ruby-${_gemname}"
pkgver='1.2.2'
pkgrel=1
pkgdesc='Daylight savings aware transformations between times in different time zones'
arch=('any')
license=('MIT')
depends=('rubygems')
options=(!emptydirs)
url="http://rubygems.org/gems/${_gemname}"
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
md5sums=('972fe2c6d57be47edb144c51340fd428')
noextract=("${_gemname}-${pkgver}.gem")

package() {
  cd "${srcdir}"
  local _gemdir=$(ruby -e 'puts Gem.default_dir')
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" \
    -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -D -m644 \
    "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
