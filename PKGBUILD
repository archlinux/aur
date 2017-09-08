# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=pygments.rb
pkgname=ruby-$_gemname
pkgver=1.1.2
pkgrel=1
pkgdesc='pygments wrapper for ruby'
arch=(any)
url='https://github.com/tmm1/pygments.rb'
license=('MIT')
depends=('ruby' 'python2' 'ruby-yajl-ruby>=1.2.0' 'ruby-posix-spawn>=0.3.6')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('dee41bf20142b6a63396504b734c183049f84629e7a943bfb361458f6f8d55e9f84ac6c28bac069d839c519eaf562bd73c74e422ebaf750a7430690a8fad043c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
