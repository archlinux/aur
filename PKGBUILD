# Maintainer: farwayer <farwayer@gmail.com>

_gemname=google-cloud-env
pkgname=ruby-${_gemname}
pkgver=1.0.5
pkgrel=2
pkgdesc="google-cloud-env provides information on the Google Cloud Platform hosting environment."
arch=('any')
depends=(
  ruby
  'ruby-faraday>=0.11' 'ruby-faraday<1'
)
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
options=(!emptydirs)
license=('MIT')
source=(
  "https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=('8457242f407b98fdb213d3a16b3c126d35257a2fb52bee0b5491866a9367120d')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
