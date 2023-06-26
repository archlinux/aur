# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: farwayer <farwayer@gmail.com>

_gemname=google-cloud-storage
pkgname=ruby-${_gemname}
pkgver=1.44.0
pkgrel=1
pkgdesc="google-cloud-storage is the official library for Google Cloud Storage."
arch=('any')
depends=(
  'ruby-addressable'
  'ruby-digest-crc'
  'ruby-google-apis-iamcredentials_v1'
  'ruby-google-apis-storage_v1'
  'ruby-googleauth'
  'ruby-google-cloud-core'
  'ruby-mini_mime'

)
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
options=(!emptydirs)
license=('MIT')
source=(
  "https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=('299a1e055c9277c8120f7c10d21d37e4d8c17c7b963350c0e0bff7e9d9a570ea')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
