# Maintainer: Michal Kimle <kimle.michal@gmail.com>

_gemname=tty-option
pkgname=ruby-$_gemname
pkgver=0.1.0
pkgrel=1
pkgdesc='An intuitive and flexible command line parser'
arch=(any)
url='https://ttytoolkit.org'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('45eb9227259c22db124c44aa2802fbda0d12537bafc5e36dfb95a712d6e41261')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem install -N --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
