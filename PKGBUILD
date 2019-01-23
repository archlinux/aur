# Maintainer: DDoSolitary <DDoSolitary@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=travis
pkgname=ruby-$_gemname
pkgver=1.8.9
pkgrel=4
pkgdesc='CLI and Ruby client library for Travis CI'
arch=(any)
url='https://github.com/travis-ci/travis.rb'
license=(MIT)
depends=(ruby ruby-backports ruby-faraday ruby-faraday-middleware ruby-gh 'ruby-highline>=1.6.0' 'ruby-highline<2.0.0' ruby-launchy ruby-pusher-client 'ruby-typhoeus>=0.6.8' 'ruby-typhoeus<1.0.0')
makedepends=('ruby-rdoc')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('fce5dfb8071629de172b8a91fad15b1d6fcc50af1ab1a41eaa1e5eb91042b90fd58e1be24779fb02972077af743ebd65183b2dff42ee47d48818f7ed2755980a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
