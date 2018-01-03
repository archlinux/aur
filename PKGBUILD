# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>

_gemname=rmagick
pkgname=ruby-rmagick
pkgver=2.16.0
pkgrel=2
pkgdesc="RMagick is an interface between the Ruby programming language and the ImageMagick image processing library"
arch=('any')
url='https://github.com/rmagick/rmagick'
license=('MIT')
depends=('ruby' 'imagemagick6')
source=("https://rubygems.org/downloads/rmagick-$pkgver.gem")
sha256sums=('06d3c969889d31065127e90a612904c575785293420f6d044a8b4dda58093d55')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/imagemagick6/pkgconfig
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


