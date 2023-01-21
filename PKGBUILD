# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=ruby-ctf-party
_gemname=ctf-party
pkgver=2.3.0
pkgrel=1
pkgdesc='A CLI tool & library to enhance and speed up script/exploit writing with string conversion/manipulation.'
arch=('x86_64')
url='https://noraj.github.io/ctf-party/'
license=('MIT')
depends=('ruby' 'ruby-docopt')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
#source=("https://github.com/noraj/$pkgname/archive/v$pkgver.tar.gz")
noextract=("$_gemname-$pkgver.gem")
b2sums=('2971475fd1e0316e6d2052f3c6d5fdba36ffc0b7ea222cf15fb3ca3bd6fe6fe038986b0a0fa215c17f3ee03941191b63f1b0f6f2b3e78acf7f0c703a17a35e1a')

package() {
  _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install --no-document \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete
  rm -r "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/test"

  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
