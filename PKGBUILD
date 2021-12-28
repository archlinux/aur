# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contrubutor: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=xz
pkgname=ruby-$_gemname
pkgver=1.0.2
pkgrel=1
pkgdesc="These are simple Ruby bindings for the liblzma library"
arch=('any')
depends=('ruby' 'ruby-ffi' 'ruby-io-like')
url="https://rubygems.org/gems/$pkgname"
noextract=($pkgname-$pkgver.gem)
license=('MIT')
source=("https://rubygems.org/downloads/$pkgname-$pkgver.gem")
sha256sums=('4c5042ae5bca1eaaf1d6cff8e11e07b6753d43abc1b221b9ea107bf9eba8af67')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
