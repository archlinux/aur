# Maintainer: Bill "biinari" Ruddock <https://github.com/biinari>
_gemname=ripper-tags
pkgname=ruby-$_gemname
pkgver=0.8.1
pkgrel=1
pkgdesc='fast, accurate ctags generator for ruby source code using Ripper'
arch=(any)
url="http://rubygems.org/gems/$_gemname"
license=("MIT")
depends=('ruby')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('7e6f6936ba01a4326bed311f0c90039f9bbfdaee01aea7f3f9b442d76fb95a45')
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install \
    -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm644 "$pkgdir/usr/lib/ruby/gems/"*"/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
