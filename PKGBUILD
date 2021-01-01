# Maintainer: Michal Kimle <kimle.michal@gmail.com>

_gemname=tty-logger
pkgname=ruby-$_gemname
pkgver=0.5.0
pkgrel=2
pkgdesc='Readable, structured and beautiful terminal logging'
arch=(any)
url='https://ttytoolkit.org'
license=(MIT)
depends=(ruby 'ruby-pastel>=0.8.0')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('52d30f0e15785e2e0295c4ca027232b846953feec65b41fcc5db5a3d9e748bdc')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem install -N --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
