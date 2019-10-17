# Maintainer: farwayer <farwayer@gmail.com>

_name=google-cloud-core
_v=1.3.2
_r=1
_gem=$_name-$_v.gem

pkgname=ruby-$_name
pkgver=$_v
pkgrel=$_r
pkgdesc="google-cloud-core is the internal shared library for google-cloud-ruby."
arch=('any')
depends=(
  ruby
  'ruby-google-cloud-env>=1' 'ruby-google-cloud-env<2'
)
url="https://rubygems.org/gems/$_name"
noextract=($_gem)
options=(!emptydirs)
license=('MIT')
source=(https://rubygems.org/downloads/$_gem)
sha256sums=('189cb6526ff79da633a2920ff43e928ed2beb14d058d552b353a3c0d9c811e0d')

package() {
  local _gemdir="$pkgdir/$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$_gemdir" "$_gem"
  rm "$_gemdir/cache/$_gem"
  install -D -m644 "$_gemdir/gems/$_name-$_v/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
