# Maintainer: Bill "biinari" Ruddock <https://github.com/biinari>
_gemname=ripper-tags
pkgname=ruby-$_gemname
pkgver=0.9.1
pkgrel=1
pkgdesc='fast, accurate ctags generator for ruby source code using Ripper'
arch=(any)
url="http://rubygems.org/gems/$_gemname"
license=("MIT")
depends=('ruby')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('2ad3b948a1fdaa8bc2d2a0dabbe412b0bf3a5ea841963ea7de6634b1a69d6d4d')
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install \
    -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm644 "$pkgdir/usr/lib/ruby/gems/"*"/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
