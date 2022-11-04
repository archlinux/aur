# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=bqm
_gemname=$pkgname
pkgver=1.0.2
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
b2sums=('919677d86da6bb3bbb8e74f60edf19c7dcd3ca6549a6e09d624450025ae2369e8391aca394e60c76f08f7083aa43cf5fb19eabfbe201af43983ccf2eddc4c4d1')

package() {
  _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install --no-document --no-wrapper \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete

  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
