# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=rabid
pkgver=0.2.0
pkgrel=1
pkgdesc='A CLI tool and library allowing to simply decode all kind of BigIP cookies'
arch=('any')
url='https://noraj.github.io/rabid/'
license=('MIT')
depends=('ruby' 'ruby-paint' 'ruby-docopt')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$pkgname-$pkgver.gem")
#source=("https://github.com/noraj/$pkgname/archive/v$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.gem")
b2sums=('2a08bfb93fc666b738ee642827f35162d7cd033ed41a30231c5702464a444255748eaba6f2c3ad03e2a2e3f5e04ad0144be2f13ba59952c0e623479693f96c6c')

package() {
  _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install --no-document \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete

  install -D -m644 "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

