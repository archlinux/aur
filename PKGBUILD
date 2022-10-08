# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=pixelchart
pkgver=1.1.0
pkgrel=1
pkgdesc='Map binary data into a beautiful chart'
arch=('any')
url='https://pixelchart.cf/index.html'
license=('MIT')
depends=('ruby' 'ruby-paint' 'ruby-docopt' 'libvips' 'imagemagick' 'ruby-rmagick' 'ruby-ruby-vips')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$pkgname-$pkgver.gem")
noextract=("$pkgname-$pkgver.gem")
b2sums=('9989e7f62cdf6be686716ec04f2ef9c1ee1ee224507b71c01ca425e355dfb0ba7393e6820eca22249b3003ec73fa1bd926947014751dcf261dabf82ce44f4950')

package() {
  _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install --no-document \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete

  install -D -m644 "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

