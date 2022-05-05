# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: farawayer <farwayer@gmail.com>

_gemname=signet
pkgname=ruby-$_gemname
pkgver=0.16.1
pkgrel=1
pkgdesc="Google's OAuth 1.0 / OAuth 2.0 implementation."
arch=(any)
url='https://rubygems.org/gems/signet'
license=('Apache')
depends=(
  'ruby'
  'ruby-addressable>=2.8' 'ruby-addressable<3'
  'ruby-faraday>=0.17.5' 'ruby-faraday<3'
  'ruby-jwt>=1.5' 'ruby-jwt<3'
  'ruby-multi_json>=1.15' 'ruby-multi_json<2'
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('016ed0caf471deaa1f58c09b12d11307104682e0b5320f45f4637580fe7b9ecb')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
