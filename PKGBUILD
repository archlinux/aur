# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=pixelchart
pkgver=1.0.1
pkgrel=1
pkgdesc='Map binary data into a beautiful chart'
arch=('any')
url='https://pixelchart.cf/index.html'
license=('MIT')
depends=('ruby' 'ruby-paint' 'ruby-docopt' 'libvips' 'imagemagick' 'ruby-rmagick' 'ruby-ruby-vips')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$pkgname-$pkgver.gem")
noextract=("$pkgname-$pkgver.gem")
b2sums=('ed771bba45a9edecb84045957d2b448d712e5e7ac302024293760b6d9b93c68d527b245f6eec4544bcf989fae9e7562a4e031f05f47d36544e33992dd28a8170')

package() {
  _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install --no-document \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete

  install -D -m644 "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

