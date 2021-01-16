# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=mini_magick
pkgname=ruby-$_gemname
pkgver=4.11.0
pkgrel=1
pkgdesc="Manipulate images with minimal use of memory via ImageMagick"
arch=(any)
url=https://github.com/minimagick/minimagick
license=(MIT)
depends=(ruby imagemagick)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://github.com/minimagick/minimagick/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('7894bf348fffc9fe3ba855c30a14c21cded9913a1dd3b7fce29d055f91d30c98')

build() {
  cd minimagick-${pkgver}
  gem build ${_gemname}.gemspec
}

package() {
  cd minimagick-${pkgver}
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 MIT-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
