# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=haiti
_gemname=haiti-hash
pkgver=4.0.0
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
b2sums=('69de4fb0f9148df1aec12e1b71f793c389b61e37ce50d7ea64df35968dd25022c2e6c3157f01ed16dc3aefa6ce86da020f61c088849e6ac4d712aaffdb63128d')

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

