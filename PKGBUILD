# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=travis
pkgname=ruby-$_gemname
pkgver=1.8.8
pkgrel=2
pkgdesc='CLI and Ruby client library for Travis CI'
arch=(any)
url='https://github.com/travis-ci/travis.rb'
license=(MIT)
depends=('ruby' 'ruby-backports' 'ruby-faraday>=0.9' 'ruby-faraday-middleware>=0.9.1' 'ruby-gh>=0.13' 'ruby-highline>=1.6' 'ruby-launchy>=2.1' 'ruby-pusher-client>=0.4.0' 'ruby-typhoeus-0.6' 'ruby-rdoc')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('f4fca2278de7263a0f4889c64dd6f78927355eece73cc600e704d0bebba2efaf86f78b8d608c0859d83c33f04b7fde47f33a4b6307d7799ff312705b40c7d563')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
