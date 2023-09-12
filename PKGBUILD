# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=rabid
pkgver=0.1.0
pkgrel=1
pkgdesc='A CLI tool and library allowing to simply decode all kind of BigIP cookies'
arch=('any')
url='https://orange-cyberdefense.github.io/rabid/'
license=('MIT')
depends=('ruby' 'ruby-paint' 'ruby-docopt')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$pkgname-$pkgver.gem")
#source=("https://github.com/Orange-Cyberdefense/$pkgname/archive/v$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.gem")
b2sums=('4545c84c2dc810f53e51dd8d28afffa7ca31ddc9751a7e1f5c28cdbd522aa439bb8b6bd6a4bb5800f57353c3728ffc9c34343fb2e5106e3ba2f70032dda91730')

package() {
  _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install --no-document \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete
  rm -r "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/test"

  install -D -m644 "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

