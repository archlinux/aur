# Maintainer: farwayer <farwayer@gmail.com>

_gemname=google-cloud-env
pkgname=ruby-${_gemname}
pkgver=1.2.0
pkgrel=1
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
sha256sums=('6d654f94af0ca42578c8fc0557a5b0ed74f141a84422e8357778798885d74548')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
