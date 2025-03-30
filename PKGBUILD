# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=ruby-ruby-vips
_gemname=ruby-vips
pkgver=2.2.3
pkgrel=1
pkgdesc='Ruby extension for the vips image processing library.'
arch=('any')
url='https://github.com/libvips/ruby-vips'
license=('MIT')
depends=('ruby' 'libvips' 'ruby-ffi')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('50725e52c5d57794509704bfcbf065092d85bf5dfb0d2069ffb38a238358630a1d68cde2a2a3dd011b178f76de3c3a1b7553e24bd5e8092b2b4dc68270ddb20c')

package() {
  _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install --no-document \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete
  rm -r "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/example"

  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

