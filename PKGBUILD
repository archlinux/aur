# Maintainer: Thomas Quillan <tjquillan@gmail.com>
# Contributor: Florian Walch <florian+aur@fwalch.com>

pkgname=ruby-neovim
_gemname=${pkgname#ruby-}
pkgver=0.10.0
pkgrel=1
pkgdesc='Ruby bindings for Neovim'
url='https://github.com/neovim/neovim-ruby'
arch=('any')
license=('MIT')
depends=('neovim' 'ruby' 'ruby-msgpack>=1.1' 'ruby-multi_json')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('8d6170279872201106de1a84c27cc40a571ec2584057a3c335b2721e7326833e')

package() {
  cd "${srcdir}"
  local _gemdir="$(/usr/bin/ruby -e'puts Gem.default_dir')"
  /usr/bin/gem install --no-user-install --no-document --ignore-dependencies -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  install -D "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
