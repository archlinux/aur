# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=ruby-ruby-vips
_gemname=ruby-vips
pkgver=2.1.4
pkgrel=1
pkgdesc='Ruby extension for the vips image processing library.'
arch=('any')
url='https://github.com/libvips/ruby-vips'
license=('MIT')
depends=('ruby' 'libvips' 'ruby-ffi')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('83b44ec7d6d796c04d6ca1255ad2d8097e4c89cd6330e5b1514084ef098fa3d2c380973ad6cca6ed5f380ccf20e77f2edb6cb367b1a94d8a13072f094f669b62')

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
