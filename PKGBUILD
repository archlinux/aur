# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# shellcheck disable=2034
# shellcheck disable=2148

_gemname=bindata
pkgname=ruby-$_gemname
pkgver=2.4.3
pkgrel=1
pkgdesc="declarative way to read and write binary file formats"
arch=('any')
url="http://bindata.rubyforge.org"
license=('custom')
depends=('ruby')
makedepends=('ruby-rdoc')
source=(
  "https://rubygems.org/downloads/$_gemname-$pkgver.gem"
  "$_gemname-$pkgver-LICENSE::https://github.com/dmendel/bindata/blob/v$pkgver/COPYING"
)
noextract=("$_gemname-$pkgver.gem")
sha256sums=(
  '5953836e884b629ab0bcb6102d201fcb9b776431ce7165ab8b9375df4f48be4f'
  'SKIP'
)

package() {
  _gemdir="$(ruby -e'puts Gem.default_dir')"

  # shellcheck disable=2154
  gem \
    install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  rmdir \
    "$pkgdir/usr/lib/ruby/gems/2.5.0/extensions" \
    "$pkgdir/usr/lib/ruby/gems/2.5.0/cache" \
    "$pkgdir/usr/lib/ruby/gems/2.5.0/build_info"

  # shellcheck disable=2154
  install -Dm644 "$srcdir"/$_gemname-$pkgver-LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
