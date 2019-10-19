# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=mini_magick
pkgname=ruby-$_gemname
pkgver=4.9.5
pkgrel=1
pkgdesc="Manipulate images with minimal use of memory via ImageMagick."
arch=(any)
url="https://github.com/minimagick/minimagick"
license=(MIT)
depends=(ruby imagemagick)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('44a2f86de6addeb5eb1f3a4114c438d126ce76b12414b9664590afd2324ec063')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
