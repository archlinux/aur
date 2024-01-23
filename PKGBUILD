# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=ruby-ctf-party
_gemname=ctf-party
pkgver=3.0.0
pkgrel=1
pkgdesc='A CLI tool & library to enhance and speed up script/exploit writing with string conversion/manipulation.'
arch=('x86_64')
url='https://noraj.github.io/ctf-party/'
license=('MIT')
depends=('ruby' 'ruby-docopt')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
#source=("https://github.com/noraj/$pkgname/archive/v$pkgver.tar.gz")
provides=('ctf-party')
conflicts=('ctf-party')
noextract=("$_gemname-$pkgver.gem")
b2sums=('2a1873754f5f84197ec7a223b137fa9f56b453dd835d43e056fa955cbfc1e321f4fe95906b5a8b362a4577d6cb22958a82758f9c8fe5276688890c9323bf7c1f')

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
