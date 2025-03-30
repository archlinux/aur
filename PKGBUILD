# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=pixelchart
pkgver=1.3.0
pkgrel=1
pkgdesc='Map binary data into a beautiful chart'
arch=('any')
url='https://noraj.github.io/PixelChart/'
license=('MIT')
depends=('ruby' 'ruby-paint' 'ruby-docopt' 'libvips' 'imagemagick' 'ruby-rmagick' 'ruby-ruby-vips')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$pkgname-$pkgver.gem")
noextract=("$pkgname-$pkgver.gem")
b2sums=('38fe6c72d2ce0b6431de4579b6f15c8ebb2778ba2445ff63eb6284e4d04916d264d3f5b2b46e50119798863cd87ad2dcb37d10733a6970b95970d201631f64ae')

package() {
  _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install --no-document \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete

  install -D -m644 "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

