# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=twitter
pkgname=ruby-$_gemname
pkgver=6.2.0
pkgrel=1
pkgdesc='A Ruby interface to the Twitter API.'
arch=(any)
url='http://sferik.github.io/twitter/'
license=(MIT)
depends=(ruby
         ruby-addressable
         ruby-buftok
         ruby-equalizer
         ruby-http
         ruby-http-form_data
         ruby-http_parser.rb
         ruby-memoizable
         ruby-multipart-post
         ruby-naught
         ruby-simple_oauth)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('c5a2d2c33d67f689d88bdf6a194ae50eaef63e0a4da9d48aeee32f15f7f85e3a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
