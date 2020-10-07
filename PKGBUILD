# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=racc
pkgname=ruby-$_gemname
pkgver=1.5.0
pkgrel=1
pkgdesc='LALR parser generator written in Ruby itself and generates ruby programs'
arch=(x86_64)
url='https://github.com/ruby/racc'
license=(BSD)
depends=(ruby)
makedepends=(rubygems ruby-rake ruby-rdoc)
options=(!emptydirs)
source=(https://github.com/ruby/racc/archive/v${pkgver}.tar.gz)
sha256sums=('628c25de6fa18108427cb0fee75f900a406e37f538c3794b2eb5620cd964f42d')

build() {
  cd "$_gemname-$pkgver"
  rake compile
  rake build
}

package() {
  cd "$_gemname-$pkgver"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    pkg/$_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
