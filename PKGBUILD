# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Mario Finelli <mario at finel dot li>

_gemname=dry-logic
pkgname=ruby-$_gemname
pkgver=1.2.0
pkgrel=1
pkgdesc="Predicate logic with rule composition"
arch=('any')
url="https://github.com/dry-rb/dry-logic"
license=('MIT')
depends=('ruby' 'ruby-concurrent' 'ruby-dry-core')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('24005b3bad9f53dcd9f91bf18cc6170106a088501ab214360f4b4474e0de2c9a60a304d772121659b7d1e93d103bdcbd92bd66ffab516d13ba1a33ac8558d849')

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
