# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contrubutor: farwayer <farwayer@gmail.com>

_gemname=dotenv
pkgname=ruby-$_gemname
pkgver=2.8.1
pkgrel=1
pkgdesc="Loads environment variables from '.env'."
arch=('any')
depends=(ruby)
url="https://rubygems.org/gems/$_gemname"
noextract=($_gemname-$pkgver.gem)
license=('MIT')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
sha256sums=('c5944793349ae03c432e1780a2ca929d60b88c7d14d52d630db0508c3a8a17d8')
options=(!emptydirs)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
