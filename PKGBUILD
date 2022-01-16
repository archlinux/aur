# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-initializer
pkgname=ruby-$_gemname
pkgver=3.1.0
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
b2sums=('48df83b5a0ab20cef52778e2c9062dd4414b0f495df8dcb27d926311a499dbdea90098fbe625283b7e7f8eb603ae1da5de9e7885e9eec2cad10393b3d8183ea5')

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
