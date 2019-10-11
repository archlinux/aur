# Maintainer: farwayer <farwayer@gmail.com>

_gemname=dotenv
pkgname=ruby-${_gemname}
pkgver=2.7.5
pkgrel=1
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
sha256sums=('c5465769f188f96a62a6cc1f801f440af077b06b788a14f66760a5178569139e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
