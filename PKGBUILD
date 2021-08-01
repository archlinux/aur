# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-inflector
pkgname=ruby-$_gemname
pkgver=0.2.1
pkgrel=1
pkgdesc="String inflections for Ruby"
arch=('any')
url="https://github.com/dry-rb/dry-inflector"
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('8d3a4000bc57bb0a1a7bd289b7ae4b7135fa34fb3703a9b7a8de8dceae8dbaaea88cb735438b1f63495b4fd9291209115bc16aada672ca2306cc082eb7974cf0')

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
