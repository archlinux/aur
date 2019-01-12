# Maintainer: farwayer <farwayer@gmail.com>

_gemname=google-cloud-storage
pkgname=ruby-${_gemname}
pkgver=1.15.0
pkgrel=1
pkgdesc="google-cloud-storage is the official library for Google Cloud Storage."
arch=('any')
depends=(
  ruby
  'ruby-digest-crc>=0.4' 'ruby-digest-crc<1'
  'ruby-google-api-client>=0.23' 'ruby-google-api-client<1'
  'ruby-googleauth>=0.6.2' 'ruby-googleauth<0.7'
  'ruby-google-cloud-core>=1.2' 'ruby-google-cloud-core<2'
)
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
options=(!emptydirs)
license=('MIT')
source=(
  "https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=('aceed9cc9e7adb9786d2332e2ac9b87b4092a442dbbc16ea984eb1e93bbe63bb')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
