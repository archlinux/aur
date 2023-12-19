# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=ruby-ruby-vips
_gemname=ruby-vips
pkgver=2.2.0
pkgrel=1
pkgdesc='Ruby extension for the vips image processing library.'
arch=('any')
url='https://github.com/libvips/ruby-vips'
license=('MIT')
depends=('ruby' 'libvips' 'ruby-ffi')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('21ed26d5c65bb877be54bc7ac4f0771412c6334e2ac354a6de87c391d84624275fcc1720c1de93eae6404aaeff6cdd06705fe2af97be0a483a30dd88c30f071f')

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
