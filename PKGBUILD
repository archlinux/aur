# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-effects
pkgname=ruby-$_gemname
pkgver=0.2.0
pkgrel=1
pkgdesc="A practical, production-oriented implementation of algebraic effects"
arch=('any')
url="https://github.com/dry-rb/dry-effects"
license=('MIT')
depends=(
  'ruby'
  'ruby-concurrent'
  'ruby-dry-container'
  'ruby-dry-core'
  'ruby-dry-inflector'
  'ruby-dry-initializer'
)
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('c332c58e49dfce606e0928a28ffcab9f953431e466c2cbc09d7c4bd23913922ebb17f7d435186f7c5a618eeb65aeb83a5efca82d30db3f655527b5d80fcac691')

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
