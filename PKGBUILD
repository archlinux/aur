# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Nathan Phillip Brink <binki@gentoo.org>

_gemname=sprockets-rails
pkgname=ruby-${_gemname}
pkgver=3.2.2
pkgrel=1
pkgdesc='Sprockets Rails integration'
arch=(any)
url='https://github.com/rails/sprockets-rails'
license=(MIT)
depends=(ruby ruby-actionpack ruby-activesupport ruby-sprockets)
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rails/sprockets-rails/archive/v${pkgver}.tar.gz")
sha512sums=('048f48930325316ac28d721a2c33ba60767dfec9456b0705e90363a1c81c8876ec6f99d65ce533d5a0704e1f67a33fcac5cd675aec5cc3c3f1cd896d518865a9')

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

  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -D -m644 MIT-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
