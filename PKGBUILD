#$Id$
# Maintainer: Matt Harrison <matt@harrison.us.com.com>

_gemname=svn2git
pkgname=ruby-$_gemname
pkgver=2.4.0
pkgrel=1
pkgdesc='Tool written in ruby to convert svn repos to git'
arch=(any)
url='https://github.com/nirvdrum/svn2git'
license=(MIT)
depends=(ruby)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('a8dc7430aa4c7c0ac50ad3b81d7b2691baa39ce27dcb060a0a78f1e5790b8e9b')

package() {
  local _gemdir="$(/usr/bin/ruby -e'puts Gem.default_dir')"
  /usr/bin/gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete
  rm -r "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/test"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}