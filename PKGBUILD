# Maintainer Valantin <valantin89 [at] gmail [dot] com>

_gemname=apipie-bindings
_pkgname=ruby-$_gemname
pkgver=0.2.2
pkgname=$_pkgname-$pkgver
pkgrel=1
pkgdesc='Bindings for API calls that are documented with Apipie. Bindings are generated on the fly.'
arch=(i686 x86_64)
url='http://github.com/Apipie/apipie-bindings'
license=(MIT)
depends=('ruby>=2.0.0'
         'ruby-json>=1.2.1'
         'ruby-oauth'
         'ruby-rest-client>=1.6.5' 'ruby-rest-client<3.0.0')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('28311bab726abf3d0a39ee6ac4c00278f68abacecb46e71199e14bb6c2053fa0')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
