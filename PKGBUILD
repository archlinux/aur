# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Anatol Pomozov

_gemname=vte3
pkgname=ruby-$_gemname
pkgver=4.2.9
pkgrel=3
pkgdesc='a Ruby binding of VTE.'
arch=(x86_64)
url=https://ruby-gnome2.osdn.jp/
license=("LGPL-2.1+")
depends=(
  ruby
  ruby-gtk3
  vte3
)
makedepends=(
  ruby-rake
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('364e61ee3e66c4b16578e5c0f45b26f7f264200f8a84e77c71fdacd813e5991b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  local _platform="$(gem env platform | cut -d':' -f2)"
  local _extension_api_version="$(ruby -e'puts Gem.extension_api_version')"
  gem install --ignore-dependencies --no-document --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir"/usr/bin $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING.LIB" "$pkgdir/usr/share/licenses/$pkgname/COPYING.LIB"
}
