# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-files
pkgname=ruby-$_gemname
pkgver=0.1.0
pkgrel=1
pkgdesc="A library that provides a great abstraction for file manipulations"
arch=('any')
url="https://github.com/dry-rb/dry-files"
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('4d69d414de354ff2b3a86b4f7a61630fb31aa5268b5c99ff74410058798323423e0f4ef9bb7d1a4bbe040c87b37a740c12cfc37a003b3792e45372c868643a40')

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
