# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: loqs

_gemname=erb
pkgname=ruby-$_gemname
pkgver=2.2.3
pkgrel=1
pkgdesc="An easy to use but powerful templating system for Ruby."
arch=('any')
url='https://github.com/ruby/erb'
license=('BSD-2')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('4a0ec81079dc5a2cfaf06c0b960c253eaeb8ec10fdfd463ec382b81a963f5e01c3fc70fe8c3977694a8066bd6632800fa02e3ed2751ff7ed955b4884bacaf286')

package() {
  cd "$srcdir"

  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem install -N --no-user-install --ignore-dependencies \
     -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
