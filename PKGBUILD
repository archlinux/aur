# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=chef-utils
pkgname=ruby-$_gemname
pkgver=17.7.22
pkgrel=1
pkgdesc="Basic utility functions for Core Chef Infra development"
arch=('any')
url="https://github.com/chef/chef/tree/master/chef-utils"
license=('Apache')
depends=('ruby' 'ruby-concurrent')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('a1354f354aa45c1b4892cdb06740c88f3fa0f1aaca57757300ef8fa16f34e43c63d5fa557c62a6c30e69b561e0a613f0913a914b6725475e4c1d239fced94bf2')
b2sums=('f7160fe1faf1996add86737394571f187f4319268607c11ef1b5b49f392f2e8d03e529218bbf552c1947284626c9450fd6eeb806f8fd12a3c4d23f67a2d13df7')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete unnecessary files
  cd "$pkgdir/$_gemdir"
  rm -vrf cache
  cd "gems/$_gemname-$pkgver"
  rm -vrf spec Rakefile "$_gemname.gemspec"

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
