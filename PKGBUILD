# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>

_gemname=ref
pkgname=ruby-$_gemname
pkgver=2.0.0
pkgrel=2
pkgdesc="An object reference implementation for Ruby"
arch=('any')
url="https://github.com/ruby-concurrency/ref"
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
optdepends=('java-runtime: for JRuby implementation')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('c575ca4d219ccd5547642cf49768559c0706830642b4d2155f20e6b7a2611633b576ddff0dc83a825d1bf8c48722eb101d3216d5ca30fbf5a44633a74bdf4769')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    --no-document \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete cache
  cd "$pkgdir/$_gemdir"
  rm -vrf cache

  cd "gems/$_gemname-$pkgver"

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" README.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" MIT_LICENSE
}
