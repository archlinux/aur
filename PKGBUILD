# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=php-serialized-formatter
pkgver=0.0.1
pkgrel=1
pkgdesc='Serialize and unserialize to|from PHP session|objects.'
arch=('x86_64')
url='https://noraj.github.io/php-serialized-formatter/'
license=('MIT')
depends=('ruby' 'ruby-docopt')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$pkgname-$pkgver.gem")
#source=("https://github.com/noraj/$pkgname/archive/v$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.gem")
b2sums=('6fc198a01485401b1264f08fc39f2b9c11f648fe289c154fb3b4b946c64cb7dea2d1c490f6a1b7066ae770a89816c89c45ad7b99f74b453f88b91b81b7f71d44')

package() {
  _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install --no-document \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete

  install -D -m644 "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

