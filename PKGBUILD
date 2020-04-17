# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=ruby-ruby-vips
_gemname=ruby-vips
pkgver=2.0.17
pkgrel=1
pkgdesc='Ruby extension for the vips image processing library.'
arch=('any')
url='https://github.com/libvips/ruby-vips'
license=('MIT')
depends=('ruby' 'libvips' 'ruby-ffi')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('404416e476adabcfc71324d6a0afd8133332f7db1e89a7721857aa4682cd3d32457920c19705c5f05ce0c0f2080ebf3c67092ad5d7f3757b86e438bbedb9f976')

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
