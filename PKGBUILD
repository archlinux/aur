# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>

pkgname=ruby-tomlrb
_gemname="${pkgname#ruby-}"
pkgver=2.0.3
pkgrel=1
pkgdesc='A racc based toml parser'
arch=('any')
url='https://github.com/fbernier/tomlrb'
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('675d45713e6c18e0783a980b46bd75b42690de4dfcb1273d362f7625c809816b80cc30753067b691498763ea3bb6190ac0118b32db8ece61652df50e47a6a8cc')

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

  # move license
  cd "gems/$_gemname-$pkgver"
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
