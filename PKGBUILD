# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=nanoc-external
pkgname=ruby-$_gemname
pkgver=1.0.5
pkgrel=1
pkgdesc="Provides an :external filter for Nanoc"
arch=('any')
url="https://nanoc.app"
license=('MIT')
depends=(
  'ruby'
  'ruby-nanoc-core'
)
_nanocver=4.12.2
options=('!emptydirs')
source=(
  "https://rubygems.org/downloads/$_gemname-$pkgver.gem"
  "LICENSE-$_nanocver::https://raw.githubusercontent.com/nanoc/nanoc/$_nanocver/$_gemname/LICENSE"
)
noextract=("$_gemname-$pkgver.gem")
b2sums=('850a8c7892468c535fc203a30db15baf17f670474c45c0023fec74473803cad73b6152ab3c6deab6f451f14b009bfb58ed51231b1a9c05644d6b02b451ae8c51'
        '39c1bde1c971c0042800d3cabd6b212152a189995154621cfe66b4646b66dfb09ea7ae0f1d2ef9b006f119c36e072e8b0b8387ce12e7dc1423e2176f5b08a630')

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
  mv -vt "$pkgdir/usr/share/doc/$pkgname" *.md

  # license
  install -vDm644 "$srcdir/LICENSE-$_nanocver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
