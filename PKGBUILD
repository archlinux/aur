# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Gordin <9ordin @t gmail dot com>

_gemname=paint
pkgname=ruby-${_gemname}
pkgver=1.0.0
pkgrel=1
pkgdesc="Ruby paint manages terminal colors and effects"
url="https://github.com/janlelis/paint"
arch=('any')
license=('MIT')
depends=('ruby-rspec' 'ruby-rspec-core' 'ruby-rainbow' 'ruby-term-ansicolor')
source=(https://rubygems.global.ssl.fastly.net/gems/${_gemname}-${pkgver}.gem)
noextract=("${_gemname}-${pkgver}.gem")
sha512sums=('a412d7d80daec622d3eb69eed5b2badae69e1d0002e849cf173453391c4ade679b368c64deb3c50520aa6bcb5635994d919642680001df598e0b74d826ec6d7f')

package() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem -n "${pkgdir}/usr/bin"
  install -Dm 644 "$(find ${pkgdir}${_gemdir} -name "MIT-LICENSE.txt")" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "$(find ${pkgdir}${_gemdir} -name "README.rdoc")" "${pkgdir}/usr/share/doc/${pkgname}/README"
  rm -r "${pkgdir}${_gemdir}/build_info"
}

# vim: ts=2 sw=2 et:
