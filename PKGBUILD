# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=chef-utils
pkgname=ruby-$_gemname
pkgver=17.9.26
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
sha512sums=('97da55e2dc7b38922875731094ca89fc47d36d499789bec239e8920ef4aef8a7e3219a9aaeab7ef59cd19cf2c7b99cbd6324642a4892a2ad611f37e56f41f0d8')
b2sums=('691c96a8ee4a4c5d76b14c8c58615edbd5990889304d2f1e202d1d7cf12dfd894fc6b9ea489b96a3659978ba07994da8eff15efaf9aef2f3d4febbdb1c7cba37')

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
