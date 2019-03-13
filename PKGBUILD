# Maintainer: farawayer <farwayer@gmail.com>

_gemname=signet
pkgname=ruby-$_gemname
pkgver=0.11.0
pkgrel=2
pkgdesc='Signet is an OAuth 1.0 / OAuth 2.0 implementation.'
arch=(any)
url='https://github.com/google/signet/'
license=(Apache-2.0)
depends=(
  ruby
  'ruby-addressable>=2.3' 'ruby-addressable<3'
  'ruby-faraday>=0.9' 'ruby-faraday<1'
  'ruby-jwt>1.5' 'ruby-jwt<3'
  'ruby-multi_json>=1.10' 'ruby-multi_json<2'
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('b09b93b4c575174283c27e2fd16ee7df3f8713da')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
