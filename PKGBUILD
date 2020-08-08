# Maintainer: Anatoly Bashmakov <anatoly at posteo dot net>

_gemname=kramdown-parser-gfm
pkgname=ruby-$_gemname-1_0
pkgver=1.0.1
pkgrel=1
pkgdesc='kramdown-parser-gfm provides a kramdown parser for the GFM dialect of Markdown'
arch=(any)
url='https://github.com/kramdown/parser-gfm'
license=(MIT)
depends=(ruby 'ruby-kramdown<3')
makedepends=('ruby-rdoc')
provides=("ruby-$_gemname=$pkgver")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('ffee0cb2cdcca0274cb662846bf0159f735a4605')

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
