# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com > 

_gemname=gems
pkgname=ruby-$_gemname
pkgver=1.2.0
pkgrel=1
pkgdesc='Ruby wrapper for the RubyGems.org API'
arch=(any)
url='https://github.com/rubygems/gems'
license=('MIT')
depends=(
  'ruby'
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('343d74bd54d906f38193f3ccd983f9d08c4b54cd01ee7e5fe8467ab41a9946f0')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
