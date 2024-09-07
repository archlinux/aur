# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=ruby-ruby-vips
_gemname=ruby-vips
pkgver=2.2.2
pkgrel=1
pkgdesc='Ruby extension for the vips image processing library.'
arch=('any')
url='https://github.com/libvips/ruby-vips'
license=('MIT')
depends=('ruby' 'libvips' 'ruby-ffi')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('dca6aafb4d103e2d09b329519759f3993c110aa802e9d39c947dd572c8ef744e14b1b28549ce8b86a92346b0a3bf5c172ece3918ae8a87f1f0fb99b99d6a1970')

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
