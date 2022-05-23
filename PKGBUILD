# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Jonne Haß <me@jhass.eu>

_gemname=json-jwt
pkgname=ruby-$_gemname
pkgver=1.13.0
pkgrel=1
pkgdesc='JSON Web Token, JSON Web Signature, JSON Web Encryption and JSON Web Key'
arch=('any')
url="https://rubygems.org/gems/$_gemname"
license=('MIT')
depends=(
  'ruby'
  'ruby-activesupport>=4.2'
  'ruby-aes_key_wrap'
  'ruby-bindata'
)
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('b9bded80ba687e59d199db365731494ee68214f27d0d7be5b635b9956b98eb5b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
