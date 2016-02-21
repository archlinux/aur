# Maintainer: Severen Redwood <severen@shrike.me>
# Report all package issues to `https://github.com/SShrike/pkgbuilds`

pkgname='ru'
pkgver='0.1.4'
pkgrel=1
pkgdesc='Ruby in your shell!'
arch=('any')
license=('MIT')
depends=('rubygems' 'ruby-activesupport')
options=(!emptydirs)
url="http://rubygems.org/gems/${pkgname}"
source=("https://rubygems.org/downloads/${pkgname}-${pkgver}.gem")
md5sums=('71a953317f54064d7283ed3f901c5cb0')
noextract=("${pkgname}-${pkgver}.gem")

package() {
  cd "${srcdir}"
  local _gemdir=$(ruby -e 'puts Gem.default_dir')
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" \
    -n "${pkgdir}/usr/bin" "${pkgname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"

  install -D -m644 \
    "${pkgdir}/${_gemdir}/gems/${pkgname}-${pkgver}/MIT-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/MIT-LICENSE"
}
