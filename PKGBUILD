# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>

_gemname=mixlib-cli
pkgname=ruby-$_gemname
pkgver=2.1.8
pkgrel=1
pkgdesc="A simple mixin for CLI interfaces, including option parsing"
arch=("any")
url="https://github.com/chef/mixlib-cli"
license=('Apache')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('f5253ee1febed74e47e314321cc9489a1e7f834181a951b7f18022370a6519b68613b5062fbd36f23e171bbfb32c2442e868d666bc67a17a69a331a3e2ca95f6')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    --no-document \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete cache
  cd "$pkgdir/$_gemdir"
  rm -vrf cache

  # move license
  cd "gems/$_gemname-$pkgver"
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE NOTICE
}
