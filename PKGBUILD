# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=rabid
pkgver=0.0.4
pkgrel=2
pkgdesc='A CLI tool and library allowing to simply decode all kind of BigIP cookies'
arch=('any')
url='https://orange-cyberdefense.github.io/rabid/'
license=('MIT')
depends=('ruby' 'ruby-paint' 'ruby-docopt')
conflicts=('rabid-git')
provides=('rabid')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
#source=("https://github.com/Orange-Cyberdefense/$pkgname/archive/v$pkgver.tar.gz")
noextract=($pkgname-$pkgver.gem)
b2sums=('002d4994fe05f008ddf01c9372ca926936f07b1670d90a2fec7f220a812ccdd43ad3907764163615de650607e2fa96d4dcff92e9f0ae46a788d5af22a57938d5')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete
  rm -r "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/test"
  install -D -m644 "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
