# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=chef-utils
pkgname=ruby-$_gemname
pkgver=17.9.46
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
sha512sums=('1454e7514613b5de43e1d3fd7331f2b0547df284448cad98cf704a30813097681fedbe3f882ba024aee003777918871f9ab94136fff68d0a21f89415ab721b98')
b2sums=('eadb2b746dee960121429e01358c5a6e0afb78814d3e418c6925302686a77152fa3f968be2887ba57e7c81b90d32b4dbe86ee8e1faac3be404fd2b51dfb9e9a3')

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
