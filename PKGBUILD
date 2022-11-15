# Maintainer: Anatol Pomozov

_gemname=vte3
pkgname=ruby-$_gemname
pkgver=4.0.3
pkgrel=1
pkgdesc='a Ruby binding of VTE.'
arch=(x86_64)
url=https://ruby-gnome2.osdn.jp/
license=("LGPL-2.1+")
depends=(vte3 ruby ruby-gtk3)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('04b1ca7fa031e570304c01c08ee67fc580a264fded637aba67bc9146f7f611b8')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  local _platform="$(gem env platform | cut -d':' -f2)"
  local _extension_api_version="$(ruby -e'puts Gem.extension_api_version')"
  gem install --ignore-dependencies --no-document --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir"/usr/bin $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING.LIB" "$pkgdir/usr/share/licenses/$pkgname/COPYING.LIB"
}
