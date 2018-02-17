# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=http
pkgname=ruby-$_gemname
pkgver=3.0.0
pkgrel=1
pkgdesc="An easy-to-use client library for making requests from Ruby. It uses a simple method chaining system for building requests, similar to Python's Requests."
arch=(any)
url='https://github.com/httprb/http'
license=(MIT)
depends=(ruby ruby-addressable ruby-http-cookie ruby-http-form_data ruby-http_parser.rb)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('da797d880d2d731097ab8ea4431ab7b0905e2cb02b19bcedf87920dc1e9612d7')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
