# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>

_gemname='puppet-resource_api'
pkgname="ruby27-${_gemname}"
pkgver=1.8.13
pkgrel=1
pkgdesc='This library provides a simple way to write new native resources for puppet.'
arch=('any')
url='https://github.com/puppetlabs/puppet-resource_api'
license=('Apache')
depends=('ruby2.7' 'ruby27-hocon')
makedepends=('ruby27-rdoc')
checkdepends=('ruby27-rake' 'ruby27-rspec')
source=("${url}/archive/${pkgver}/${_gemname}-${pkgver}.tar.gz")
noextract=("$_gemname-$pkgver.gem")
options=("!emptydirs")
sha512sums=('cc675e6142cf474fb0eea31259f9c738c5ed428a7546c0630411a4aa0fc45597424cb7056882460eb00103057ad286e60a5a774037b11c7a3f6d8a2f1e148ea1')

build() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  gem-2.7 build "${_gemname}.gemspec"
}

check() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  # tests currently don't work because of outdated and partially dependencies
  #rake test
}

package() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  local _gemdir="$(gem-2.7 env gemdir)"
  gem-2.7 install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 NOTICE LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm 644 CHANGELOG.md CONTRIBUTING.md HISTORY.md README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  rm -r "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:
