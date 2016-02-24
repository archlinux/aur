# Maintainer: Severen Redwood <severen@shrike.me>
# Report all package issues to `https://github.com/SShrike/pkgbuilds`

_gemname='i18n'
pkgname="ruby-${_gemname}"
pkgver='0.7.0'
pkgrel=1
pkgdesc='New wave internationalisation support for Ruby'
arch=('any')
license=('MIT')
depends=('rubygems')
options=(!emptydirs)
url="http://rubygems.org/gems/${_gemname}"
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
md5sums=('e9f92faf73a805a95c92d42031f4dca3')
noextract=("${_gemname}-${pkgver}.gem")

package() {
  cd "${srcdir}"
  local _gemdir=$(ruby -e 'puts Gem.default_dir')
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" \
    -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -D -m644 \
    "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/MIT-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/MIT-LICENSE"
}

# vim:set ts=2 sw=2 et:
