# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-schema
pkgname=ruby-$_gemname
pkgver=1.7.0
pkgrel=1
pkgdesc="Coercion and validation for data structures"
arch=('any')
url="https://github.com/dry-rb/dry-schema"
license=('MIT')
depends=(
  'ruby'
  'ruby-concurrent'
  'ruby-dry-configurable'
  'ruby-dry-core'
  'ruby-dry-initializer'
  'ruby-dry-logic'
  'ruby-dry-types'
)
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('6dc014069efee3bc0b2d4443fb331f16558c482c647350eb604bb464660eeae2d11e50e90a33d8454cb5ba0fc43a6bf1412bf8568deed404619c2aabe255d359')

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
