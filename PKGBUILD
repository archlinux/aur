# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=bqm
_gemname=$pkgname
pkgver=1.3.0
pkgrel=1
pkgdesc='Download BloudHound query lists, deduplicate entries and merge them in one file.'
arch=('any')
url='https://github.com/Acceis/bqm'
license=('MIT')
depends=('ruby')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
#source=("https://github.com/Acceis/$pkgname/archive/v$pkgver.tar.gz")
noextract=("$_gemname-$pkgver.gem")
b2sums=('3ab24d78d049b9c6100816a654f8194102b4722910b73adb495b351ae6fc2728a8533be2e7167d5d6e64ecb402542e9750e174fa2e743b943f9ba3258c9309ec')

package() {
  _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install --no-document --no-wrapper \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete

  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
