# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

_gemname=activemodel
pkgname=ruby-$_gemname
pkgver=6.1.3
pkgrel=1
pkgdesc='A toolkit for building modeling frameworks (part of Rails).'
arch=(any)
url='http://www.rubyonrails.org'
license=(MIT)
options=(!emptydirs)
makedepends=(ruby-rake)
depends=(ruby ruby-activesupport)
source=("rails-${pkgver}.tar.gz::https://github.com/rails/rails/archive/v${pkgver}.tar.gz")
sha512sums=('ec6e871e3226c3efa5dc7f59cbd1819b45ab0d1a21b39b8c2d76022fff761fb268f79c7b560b987af245d9e305ecc4517379de3769d468b5a548005f8533044a')

prepare() {
  cd "rails-${pkgver}/${_gemname}"

  sed -r 's|~>|>=|g' -i "${_gemname}.gemspec"
}

build() {
  cd "rails-${pkgver}/${_gemname}"

  gem build "${_gemname}.gemspec"
}

package() {
  cd "rails-${pkgver}/${_gemname}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -D -m644 MIT-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
