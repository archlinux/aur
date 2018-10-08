# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

_gemname=guard-nanoc
pkgname=ruby-$_gemname
pkgver=2.1.4
pkgrel=1
pkgdesc='Guard helper gem for nanoc static site generator'
arch=('any')
url='https://github.com/nanoc/nanoc/tree/master/guard-nanoc'
license=('MIT')
depends=("ruby-guard" "nanoc")
makedepends=("ruby-rdoc")
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('505978cac1c5b9cb814156ef7b1006a2bd07bff6d91819cc4ef80aaaa4db7b11')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  # license
  install -Dm644 "$pkgdir/$_gemdir"/gems/$_gemname-$pkgver/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
