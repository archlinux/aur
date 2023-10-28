# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=haiti
_gemname=haiti-hash
pkgver=2.0.0
pkgrel=1
pkgdesc='Hash type identifier (CLI & lib)'
arch=('any')
url='https://noraj.github.io/haiti/'
license=('MIT')
depends=('ruby' 'ruby-paint' 'ruby-docopt')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
#source=("https://github.com/noraj/$pkgname/archive/v$pkgver.tar.gz")
noextract=("$_gemname-$pkgver.gem")
b2sums=('6390629ff0209e3950f7890c0f109e5aecf2e9ae8babcbbed7396c608e822d6a430ca65809cc80b2aa085b6465f48e96a338b940afea5bf823dea6c71fca9013')

package() {
  _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install --no-document \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete

  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

