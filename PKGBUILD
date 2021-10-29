# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=chef-utils
pkgname=ruby-$_gemname
pkgver=17.7.29
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
sha512sums=('2533104f0a79053c30ecf940ec6aa814cb2b892ad0a59de765be5350326026d41607b2a42b6c3afc592400bf4604c16bca9b67402550a0d96bd2a8a82552a6bf')
b2sums=('701b50225532dafc9794dcf1dead25a65f484a799c4dbe65717b5bb986a6a72a3be361471ce5e15331e6491451cc6239fc7cb28079cdb35f3f9ac5da4c8b5ec6')

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
