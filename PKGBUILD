# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=bqm
_gemname=$pkgname
pkgver=1.5.2
pkgrel=1
pkgdesc='Download BloudHound query lists, deduplicate entries and merge them in one file.'
arch=('any')
url='https://github.com/noraj/bqm'
license=('MIT')
depends=('ruby')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
#source=("https://github.com/noraj/$pkgname/archive/v$pkgver.tar.gz")
noextract=("$_gemname-$pkgver.gem")
b2sums=('f2ac2b8dc3511b6fa3c4cc51a3616d462cbbbe42b57aabbda0eae5438281500515241c0ba57b681ab99d193d00a2f12d697cc90f48ce07dc1351928a3098c94d')

package() {
  _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install --no-document --no-wrapper \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete

  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
