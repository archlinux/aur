# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-system
pkgname=ruby-$_gemname
pkgver=0.21.0
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
sha512sums=('9ada1d5322ea4b0e07e34a98942c2114223571f837d4b4a353c8bd91231e05184a8fc45e35c4466ffd102b7a2084a0fdefccc8408bb6a4a22abf0911d6d62efb')
b2sums=('fe11d3c6f9fd4174b7bef667220a65f6bd296f3303eeff89dc3446489a394583fda830dee144b66ebd9d6f68501194bf093fabcf4be952dc974104e5dfa74d68')

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
