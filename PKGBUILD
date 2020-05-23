# Maintainer: DDoSolitary <DDoSolitary@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=travis
pkgname=ruby-$_gemname
pkgver=1.9.1
pkgrel=1
pkgdesc='CLI and Ruby client library for Travis CI'
arch=(any)
url='https://github.com/travis-ci/travis.rb'
license=(MIT)
depends=(ruby ruby-backports ruby-faraday ruby-faraday-middleware ruby-gh ruby-highline ruby-json ruby-launchy ruby-pusher-client ruby-typhoeus-0.6 ruby-pry)
makedepends=('ruby-rdoc')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('1489a1378fcbfcd70ce48f1f7b00bbc457503eabf192bd76feaf9896c63ef6ea77c67c077c8c940b11f6c11cf9b28b752db309b060727e1dc36b1ef1b5b4b514')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
