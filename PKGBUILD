# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname=faraday-net_http
pkgname=ruby-$_gemname
pkgver=1.0.1
pkgrel=1
pkgdesc='Faraday adapter for Net::HTTP'
arch=(any)
url="https://github.com/lostisland/${_gemname}"
license=(MIT)
options=(!emptydirs)
depends=(ruby)
makedepends=(ruby-rake)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('57a7ea2f452844200119cb9e99ae4bfee5e01b0630b38b4ef4e615dfcc05e1476e3da8511698bf199c62b816b5253fb364ed6cffdc59dcd4e9d706c7f1e6e56b')

prepare() {
  cd "${_gemname}-${pkgver}"

  sed -r 's|~>|>=|g' -i "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  gem build "${_gemname}.gemspec"
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
