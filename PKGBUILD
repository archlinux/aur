# Maintainer: asmdey <pavel.finkelshtein@jetbrains.com>

_gemname=tty-spinner
pkgname=ruby-$_gemname
pkgver=0.9.3
pkgrel=1
pkgdesc="A terminal spinner for tasks that have non-deterministic time frame."
arch=(any)
url='http://github.com/piotrmurach/tty-spinner'
license=(MIT)
depends=(
  ruby
  'ruby-tty-cursor>=0.7' 'ruby-tty-cursor<1'
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('0e036f047b4ffb61f2aa45f5a770ec00b4d04130531558a94bfc5b192b570542')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
