# Maintainer: Michal Kimle <kimle.michal@gmail.com>

_gemname=epoll
pkgname=ruby-$_gemname
pkgver=0.3.0
pkgrel=1
pkgdesc='A Ruby binding for epoll(7)'
arch=(any)
url='https://github.com/ksss/epoll'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('bf8a2b74dfec14320146e4fed8f931c8724f2d560f50e10732cf278c0a1454d1')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  local _rubyversion="$(ruby -e'puts Gem.ruby_api_version')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem install -N --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  rm "$pkgdir/$_gemdir/extensions/"*"/$_rubyversion/$_gemname-$pkgver/gem_make.out"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
