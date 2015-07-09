# Maintainer: Gordin <9ordin @t gmail dot com>
# Contributor: Levente Polyak <levente[at]leventepolyak[dot]net>

_gemname=paint
pkgname=ruby-${_gemname}
pkgver=0.8.6
pkgrel=1
pkgdesc="Terminal painter!"
arch=('any')
url="https://github.com/janlelis/paint"
license=('MIT')
depends=('ruby' 'ruby-rspec' 'ruby-rspec-core' 'ruby-rainbow' 'ruby-term-ansicolor')
makedepends=('rubygems')
source=("http://gems.rubyforge.org/gems/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('8444e3656254df5361daa627d9b18aec0edeedfcc135e27e5e92c43f739652d8')

package() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" ${_gemname}-$pkgver.gem -n "$pkgdir/usr/bin"
  install -Dm 644 "$(find ${pkgdir}${_gemdir} -name "LICENSE.txt")" "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm 644 "$(find ${pkgdir}${_gemdir} -name "README.rdoc")" "${pkgdir}"/usr/share/doc/${pkgname}/README.rdoc
  find ${pkgdir}${_gemdir} -type d -name build_info -delete
}

# vim:set ts=2 sw=2 et:
