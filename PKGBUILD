# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>

_gemname=json_schema
pkgname=ruby-$_gemname
pkgver=0.21.0
pkgrel=1
pkgdesc="JSON Schema & Hyperschema V4 parser and validator"
arch=('any')
url="https://github.com/brandur/json_schema"
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('c7555975d40e41fb2671addb5b9298349029068fe6c68184a30fd7f9663f7a01b743d3e0eb1c171dc61edb9750bc464e7e8c1039a896bbe6b0b81ea9a909b6bf')

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

  # remove unnecessary files & folders
  cd "gems/$_gemname-$pkgver"
  rm -vrf test

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" README.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
