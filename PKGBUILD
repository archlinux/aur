# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-initializer
pkgname=ruby-$_gemname
pkgver=3.0.4
pkgrel=1
pkgdesc="DSL for building class initializer with params and options"
arch=('any')
url="https://github.com/dry-rb/dry-initializer"
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('b958262cdd3253d5c153342d0cceb0938f546c8494f7388009ea2db9b0ff8a56cbfe6fd13bc1a5fd77fa746b55b6ccd2ecce4be57fe157762212d454fffd6224')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete cache
  cd "$pkgdir/$_gemdir"
  rm -vrf cache

  # delete unnecessary files & folders
  cd "gems/$_gemname-$pkgver"
  rm -vrf "$_gemname.gemspec" tasks

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" *.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
