# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=rubyntlm
pkgname=ruby-$_gemname
pkgver=0.5.2
pkgrel=1
pkgdesc='Ruby/NTLM provides message creator and parser for the NTLM authentication.'
arch=(any)
url='https://github.com/winrb/rubyntlm'
license=(MIT)
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('29a29756b6788257f2ed9a3a7ef5cbdcd4b7871922658d922c46ee127a89848232450cb17b23d8f7fda023399d4ec9b1029c51f7a2fb7cdc635028e56e340aa5')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
