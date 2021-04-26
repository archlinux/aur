# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contrubutor: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=ruby-xz
pkgname=${_gemname}
pkgver=1.0.0
pkgrel=1
pkgdesc="These are simple Ruby bindings for the liblzma library"
arch=('any')
depends=('ruby' 'ruby-ffi' 'ruby-io-like')
url="https://rubygems.org/gems/$_gemname"
noextract=($_gemname-$pkgver.gem)
license=('MIT')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('a1e028fcf436df631d0cd00bb448eccedc8890b58cd70eecf5f9541739ea236e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
