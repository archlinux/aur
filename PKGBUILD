# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-struct
pkgname=ruby-$_gemname
pkgver=1.4.0
pkgrel=1
pkgdesc="Typed struct and value objects"
arch=('any')
url="https://github.com/dry-rb/dry-struct"
license=('MIT')
depends=('ruby' 'ruby-concurrent' 'ruby-dry-core' 'ruby-dry-types' 'ruby-ice_nine')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('1bb2be0785c2ceb652e87cf4a854d2a69d1641e92520c781e125fab6df2a9710ffb6687fa779eb60e0aafb40253b078d0e4848551c5b725a62d159121759c785')

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
