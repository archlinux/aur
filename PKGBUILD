# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=pygments.rb
pkgname=ruby-$_gemname
pkgver=0.6.3
pkgrel=2
pkgdesc='pygments wrapper for ruby'
arch=(any)
url='https://github.com/tmm1/pygments.rb'
license=('MIT')
depends=('ruby' 'python2' 'ruby-yajl-ruby>=1.2.0' 'ruby-posix-spawn>=0.3.6')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('faa9d04b0571e34d5b01cf8ac8b70a68aa3e2555d222199c0090c0b71ae4046e74fc6e64fe8fd0c327fbe9c4a4efb34a91a02dec962086e8d9f8d881bff1eff0')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
