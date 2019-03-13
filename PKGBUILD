# Maintainer: farawayer <farwayer@gmail.com>

_gemname=faraday-cookie_jar
pkgname=ruby-$_gemname
pkgver=0.0.6
pkgrel=5
pkgdesc='Manages client-side cookie jar for Faraday HTTP client'
arch=(any)
url='https://github.com/miyagawa/faraday-cookie_jar'
license=(MIT)
depends=(
  ruby
  'ruby-faraday>=0.7.4'
  'ruby-http-cookie<1.1' 'ruby-http-cookie>=1'

  # missed by ruby-http-cookie
  ruby-domain_name
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('0c3f1b3e14be4c3e44971b9c8d59410e2001c3a5')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
