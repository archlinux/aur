# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
_gemname=semantic_puppet
pkgname="ruby27-$_gemname"
pkgver=1.0.3
pkgrel=2
pkgdesc='Tools used by Puppet to parse, validate, and compare Semantic Versions and Version Ranges and to query and resolve module dependencies.'
arch=('any')
url='https://github.com/puppetlabs/semantic_puppet#semanticpuppet'
depends=('ruby2.7')
makedepends=('ruby27-rdoc')
license=('Apache')
options=('!emptydirs')
source=("https://rubygems.org/gems/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha512sums=('bdca6793a064d37d15010551c579f61837b1095025d84469ed8893d4bbed4372cde005ed452460a8d771c8e4bf842283628f2c613295bab0af3834cdc163f7ba')
package() {
  local _gemdir="$(ruby-2.7 -e'puts Gem.default_dir')"

  gem-2.7 install \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "${pkgdir}${_gemdir}" \
    --bindir "${pkgdir}/usr/bin" \
    --verbose \
    ${_gemname}-${pkgver}.gem

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -D -m644 "${pkgdir}${_gemdir}/gems/semantic_puppet-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
