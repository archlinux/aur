# Maintainer: farwayer <farwayer@gmail.com>

_gemname=google-cloud-core
pkgname=ruby-${_gemname}
pkgver=1.3.0
pkgrel=1
pkgdesc="google-cloud-core is the internal shared library for google-cloud-ruby."
arch=('any')
depends=(
  ruby
  'ruby-google-cloud-env>=1' 'ruby-google-cloud-env<2'
)
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
options=(!emptydirs)
license=('MIT')
source=(
  "https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=('45627cccef12e1faf1a0635e3442275169c065468bb596e4e2cd48fc8628163f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
