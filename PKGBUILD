# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-system
pkgname=ruby-$_gemname
pkgver=0.22.0
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
sha512sums=('48511d8e96f8d6fb30eda5f727a47b6958802e3f2dd0e709882047f9819cdd736cc3519ad87aa8bf701b1ba83385305599b5e3f7fdd5cbd10652f29dd7993abd')
b2sums=('a4ec8722647cfedb59d53e7fa98b1b2803b5fba1fe269130ba737548428da18fdfa91ab27c3edce8e54d093ca366c03358ca08706a412e5572ff49325fb8ebb7')

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
