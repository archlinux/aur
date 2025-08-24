# Maintainer: envolution
# Contributor: Dmitry Kharitonov <arch[at]nano-model[dot]com>
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>

_gemname=rmagick
pkgname=ruby-rmagick
pkgver=6.1.4
pkgrel=1
pkgdesc="RMagick is an interface between the Ruby programming language and the ImageMagick image processing library"
arch=('any')
url='https://github.com/rmagick/rmagick'
license=('MIT')
depends=('ruby' 'imagemagick')
makedepends=('rubygems')
optdepends=('libmagick6: for ImageMagick 6 support')
source=("https://rubygems.org/downloads/rmagick-$pkgver.gem")
sha256sums=('038593dd017bcb538c80a1a03800963c8050b808903daa57fce4f74259b30f65')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/imagemagick6/pkgconfig \
    gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ft=PKGBUILD et sw=2:
