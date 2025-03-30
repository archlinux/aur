# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=haiti
_gemname=haiti-hash
pkgver=3.0.0
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
b2sums=('cad1c43fe50df75cfc5845fcdcaf1a493b930844d1d77f57d42f5a96763bdfbcf566a6496171f6adad74412e968f18a5633c6d317ea8ac153f71803dee25af3f')

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

