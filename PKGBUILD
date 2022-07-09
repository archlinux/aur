# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contrubutor: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=xz
pkgname=ruby-$_gemname
pkgver=1.0.3
pkgrel=2
pkgdesc="Ruby bindings for liblzma using fiddle"
arch=('any')
depends=('ruby' 'xz')
url="https://rubygems.org/gems/$pkgname"
noextract=($pkgname-$pkgver.gem)
license=('MIT')
source=("https://rubygems.org/downloads/$pkgname-$pkgver.gem")
sha256sums=('60f8418f65880b64882c7d20a5d6e09bda72037d05fdd71a4fda60c7c25b71d7')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
