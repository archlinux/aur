# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=haiti
_gemname=haiti-hash
pkgver=1.3.0
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
b2sums=('3ac933de9563676f9f555315d7f6b5dfa4cdbd2fc95806b2de72af563dfe8def21e716601e09dad5cce37bbe7da7462f5f1a79d8af072ed2c278e827993d5ec1')

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

