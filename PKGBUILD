# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-initializer
pkgname=ruby-$_gemname
pkgver=3.1.1
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
b2sums=('f23ff593389f0da2ba96823873b941f43a9aa732b30bc3541694866080673a99e18594db29c6caea9f6289a50a7a96a330199629422f038dc4dc17bd42e5d6f6')

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
