# Maintainer: farwayer <farwayer@gmail.com>

_gemname=dotenv
pkgname=ruby-${_gemname}
pkgver=2.7.1
pkgrel=2
pkgdesc="Loads environment variables from '.env'."
arch=('any')
depends=(ruby)
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
options=(!emptydirs)
license=('MIT')
source=(
  "https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=('b6ecf47730f3423f2f9a3b9521c033bed83856cc206d834c9541797a05007dc9')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
