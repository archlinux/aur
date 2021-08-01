# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-transformer
pkgname=ruby-$_gemname
pkgver=0.1.1
pkgrel=1
pkgdesc="Data transformation toolkit"
arch=('any')
url="https://github.com/dry-rb/dry-transformer"
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('d4318076aaeea2615d22334e649297e46f1a05cc112e4794bdc0e8e35f1b18564e899588d3ed0730f3934185d4a544ebf9b200a5649f00c6d52e2f4a83075a03')

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
