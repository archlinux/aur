# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Mario Finelli <mario at finel dot li>

_gemname=dry-configurable
pkgname=ruby-$_gemname
pkgver=0.13.0
pkgrel=1
pkgdesc="A mixin to add configuration functionality to your classes"
arch=('any')
url="https://github.com/dry-rb/dry-configurable"
license=('MIT')
depends=('ruby' 'ruby-concurrent' 'ruby-dry-core')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('bb2faa7387b3a2066d95d0ae3dd1e83edd0f61983b7cefaa7b3faa4c8809ae52eb654087e684bac9ad3ac837e6fb4470f7931cfdc9a1fde47add0b4ab1e5d38d')

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
