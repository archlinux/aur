# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=travis
pkgname=ruby-$_gemname
pkgver=1.8.6
pkgrel=1
pkgdesc='CLI and Ruby client library for Travis CI'
arch=(any)
url='https://github.com/travis-ci/travis.rb'
license=(MIT)
depends=('ruby' 'ruby-backports' 'ruby-faraday>=0.9' 'ruby-faraday_middleware>=0.9.1' 'ruby-gh>=0.13' 'ruby-highline>=1.6' 'ruby-launchy>=2.1' 'ruby-pusher-client>=0.4.0' 'ruby-typhoeus-0.6')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('d8d182f9b37feeb25a46737ff2d80f728c971e19756705f4d826eb90eeb9e83ceb398600978885e49fc23a342211c80e67718d68e6dea6c5dedc9a612b5b6039')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
