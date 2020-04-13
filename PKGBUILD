# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=ruby-ctf-party
_gemname=ctf-party
pkgver=1.2.0
pkgrel=1
pkgdesc='A library to enhance and speed up script/exploit writting for CTF players'
arch=('x86_64')
url='https://orange-cyberdefense.github.io/ctf-party/'
license=('MIT')
depends=('ruby')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
#source=("https://github.com/Orange-Cyberdefense/$pkgname/archive/v$pkgver.tar.gz")
noextract=("$_gemname-$pkgver.gem")
b2sums=('2aafce9ee3cf78e9c417058ccfcdcd74ad2c1964bf5b1bd07c7272207d2f0fedb08640a88083b9e5b4bb07beca7a95fcd6bbf2b9b0a069a747770f7f5125b2c7')

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
