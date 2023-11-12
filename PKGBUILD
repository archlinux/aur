# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=haiti
_gemname=haiti-hash
pkgver=2.1.0
pkgrel=1
pkgdesc='Hash type identifier (CLI & lib)'
arch=('any')
url='https://noraj.github.io/haiti/'
license=('MIT')
depends=('ruby' 'ruby-paint' 'ruby-docopt')
optdepends=('fzf: for haiti-fzf, john-haiti, hashcat-haiti CLI commands'
            'john: for john-haiti CLI command'
            'hashcat: for hashcat-haiti CLI command')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
#source=("https://github.com/noraj/$pkgname/archive/v$pkgver.tar.gz")
noextract=("$_gemname-$pkgver.gem")
b2sums=('e3ef86a28c30dd6b447f160d4d7d20c1a72788d73dd6ed810c667295cae8d557c349a3ce3245381010a1e490acb5a5c62cfee33bea8c6111e98e287d243b4251')

package() {
  _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install --no-document \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete

  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -D -m644 -t "$pkgdir/usr/share/man/man1/" \
    "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/man/"*.1
}

