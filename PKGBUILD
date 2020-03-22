# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>

_gemname=rmagick
pkgname=ruby-rmagick
pkgver=4.1.0
pkgrel=1
pkgdesc="RMagick is an interface between the Ruby programming language and the ImageMagick image processing library"
arch=('any')
url='https://github.com/rmagick/rmagick'
license=('MIT')
depends=('ruby' 'imagemagick')
optdepends=('libmagick6: for ImageMagick 6 support')
source=("https://rubygems.org/downloads/rmagick-$pkgver.gem")
sha256sums=('591a5c01d0eb2d10cc4e73844580a8802ebfc39e53547f4ff24c2b8142a1208a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/imagemagick6/pkgconfig \
    gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


