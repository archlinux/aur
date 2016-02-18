# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=travis
pkgname=ruby-$_gemname
pkgver=1.8.2
pkgrel=1
pkgdesc='CLI and Ruby client library for Travis CI'
arch=(any)
url='https://github.com/travis-ci/travis.rb'
license=(MIT)
depends=('ruby' 'ruby-addressable>=2.3' 'ruby-backports' 'ruby-faraday>=0.9' 'ruby-faraday_middleware>=0.9.1' 'ruby-gh>=0.13' 'ruby-highline>=1.6' 'ruby-launchy>=2.1' 'ruby-pry-0.9' 'ruby-typhoeus>=0.6.8' 'ruby-pusher-client>=0.4.0')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('e047b72d76804d6987698fc47e7acf62125b04862e6671d4887c3d982ecc3b16c4ff1aee8afed5b29ab7c39d622afdbee21d4365f81abb7d505f9092cb4a6a52')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
