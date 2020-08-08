# Maintainer: Anatoly Bashmakov <anatoly at posteo dot net>

_gemname=unf
pkgname=ruby-$_gemname-1
pkgver=0.1.4
pkgrel=1
pkgdesc='A wrapper library to bring Unicode Normalization Form support to Ruby/JRuby'
arch=(any)
url='https://github.com/knu/ruby-unf'
license=('BSD')
depends=(ruby ruby-unf_ext)
makedepends=('ruby-rdoc')
provides=("ruby-$_gemname=$pkgver")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('847ecaefb95c6639920a70e21812fad48c40fe08')

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
