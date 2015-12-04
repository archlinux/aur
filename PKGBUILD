# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=rubyntlm
pkgname=ruby-${_gemname}_0.4.0
pkgver=0.4.0
pkgrel=1
pkgdesc='Ruby/NTLM provides message creator and parser for the NTLM authentication.'
arch=(any)
url='https://github.com/winrb/rubyntlm'
license=(MIT)
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('33a845b3b898d5e45ef51d4c3ab9a928789d2506c9854dedac2afb71b639abd91054c89357a0f33f975984172b8b7bf58c22a6ec50e4ab423d3269910284151e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
