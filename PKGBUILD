# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=chef-utils
pkgname=ruby-$_gemname
pkgver=17.9.42
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
sha512sums=('0c1f1ecd838e1be4a68c886c934858bf8697cf3e5de6969f4e820bc655d5ee7a2eb5f857be41fdb347c7e56fc2f2758a5efc6b14b609feb57a49d3a722d7d52f')
b2sums=('aeda566a32b8f87b44eec8e16fa1b696144fbc23f87ce5636a858d72d088d77fa94fd46a1194c0ae9b6c4d720cd02e0d95ff1817e63c8ba978c374d1fc9519f1')

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
