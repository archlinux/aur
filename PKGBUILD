# Contributor: Anatoly Bashmakov <anatoly at posteo dot net>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=execjs
pkgname=ruby-$_gemname
pkgver=2.9.1
pkgrel=1
pkgdesc='Run JavaScript code from Ruby'
arch=('any')
url='https://github.com/rails/execjs'
license=('MIT')
depends=('ruby' 'nodejs')
makedepends=('ruby-rdoc')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('e8fd066f6df60c8e8fbebc32c6fb356b5212c77374e8416a9019ca4bb154dcfb')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
