# Maintainer: Michal Kimle <kimle.michal@gmail.com>

_gemname=tty-config
pkgname=ruby-$_gemname
pkgver=0.4.0
pkgrel=1
pkgdesc='Define, read and write any Ruby app configurations with a penchant for terminal clients.'
arch=(any)
url='https://ttytoolkit.org'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('d7122fb848ec764e472b8c9143528dc7a796774f6b5487d5817b528bacabce1c')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem install -N --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
