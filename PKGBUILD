# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=rabid
pkgver=0.0.5
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
b2sums=('e9c69aa492e2ed09fc3e84d52663780c05ee99c01c6d9c9f85dfab0b2f38e3cfbcf8c0c964206d4c79817804e7ce0d0ace8cdc140aecd184877efe7367d84ff5')

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

