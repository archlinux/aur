# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-system
pkgname=ruby-$_gemname
pkgver=0.23.0
pkgrel=1
pkgdesc="Organize your code into reusable components"
arch=('any')
url="https://github.com/dry-rb/dry-system"
license=('MIT')
depends=(
  'ruby'
  'ruby-concurrent'
  'ruby-dry-auto_inject'
  'ruby-dry-configurable'
  'ruby-dry-container'
  'ruby-dry-core'
  'ruby-dry-inflector'
  'ruby-dry-struct'
)
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('47e057dab8af7bad8a40c0ca73d0e122ba1e90e63b79407cd442403f071d72bb7853347c03f30d0116965a52eaf3841917a1c36469f4428fe8a2458f45d2b4a4')
b2sums=('4500e723f44048d7408691eb08305c979d27fe91171fc3685185647fadbb6e7371879390004ad35d2f6b013c30c5b21a3ea31e604ada9f17e64f1a86a20e2622')

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
  rm -vrf "$_gemname.gemspec"

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" *.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
