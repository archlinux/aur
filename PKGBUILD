# Maintainer: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Severen Redwood <severen.redwood@gmail.com>

_gemname='minitest'
pkgname="ruby-${_gemname}"
pkgver=5.8.4
pkgrel=1
pkgdesc='A complete suite of testing facilities supporting TDD, BDD, mocking and benchmarking'
arch=('any')
license=('MIT')
depends=('rubygems')
options=(!emptydirs)
url="http://rubygems.org/gems/${_gemname}"
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
md5sums=('7712006877fd658f966389f5febe02fe')
noextract=("${_gemname}-${pkgver}.gem")

package() {
  cd "${srcdir}"
  local _gemdir=$(ruby -e 'puts Gem.default_dir')
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" \
    -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  sed -n '/Copyright (c)/,/IN THE SOFTWARE./p' \
    "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/README.rdoc" > \
    "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE"
  install -D -m644 \
    "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
