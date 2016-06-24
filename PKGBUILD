# Maintainer: Christopher Loen <christopherloen at gmail dot com>
_gemname_='chef-config'
pkgname="ruby-${_gemname_}"
pkgver='12.11.18'
pkgrel=1
pkgdesc="Chef's default configuration and config loading"
arch=('any')
url='https://github.com/chef/chef'
license=('Apache-2.0')
depends=('ruby' 'ruby-fuzzyurl' 'ruby-mixlib-config' 'ruby-mixlib-shellout')
options=(!emptydirs)
source=('https://rubygems.org/downloads/chef-config-12.11.18.gem')
noextract=("${_gemname_}-${pkgver}.gem")
sha256sums=('de0167c4cd9a6d1a49e2365298b968111e8768f0d1d38a6f4f37f9707525fa7a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname_}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"          
}
