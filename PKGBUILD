# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=pixelchart
pkgver=1.2.0
pkgrel=1
pkgdesc='Map binary data into a beautiful chart'
arch=('any')
url='https://pixelchart.cf/index.html'
license=('MIT')
depends=('ruby' 'ruby-paint' 'ruby-docopt' 'libvips' 'imagemagick' 'ruby-rmagick' 'ruby-ruby-vips')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$pkgname-$pkgver.gem")
noextract=("$pkgname-$pkgver.gem")
b2sums=('e1673f5d50916f98820e36a1cd46cbeef404c83a6c0b9b4288d779e4b7ca14bb5a47a32072e030549bdd8bbba24a5225a0b6ffd151f96655e36175217731dc44')

package() {
  _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install --no-document \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete

  install -D -m644 "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

