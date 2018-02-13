# Maintainer: James An <james@jamesan.ca>

_gemname=thin
pkgname=ruby-$_gemname-1.5
pkgver=1.5.1
pkgrel=1  
pkgdesc='A thin and fast web server'
arch=(any)
url='http://code.macournoyer.com/thin/'
license=(GPL RUBY)
depends=(ruby ruby-daemons ruby-eventmachine-1.0 ruby-rack)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('4280f5a3db7c4d6470c15f6acec9a0dded057ab8')

prepare() {
  gem unpack "$_gemname-$pkgver.gem"
  gem spec "$_gemname-$pkgver.gem" --ruby >| "$_gemname-$pkgver/$_gemname-$pkgver.gemspec"

  cd "$_gemname-$pkgver"
  gem build "$_gemname-$pkgver.gemspec"
}

package() {
  cd "$_gemname-$pkgver"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install  --no-document --no-user-install --ignore-dependencies -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "$pkgdir/usr/bin/thin"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  rm -r "$pkgdir/$_gemdir/extensions"
  rm -r "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/bin"
  rm -r "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/example"
  rm -r "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/ext"
}

