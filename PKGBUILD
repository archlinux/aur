# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=librarianp
pkgname=ruby-$_gemname
pkgver=0.6.4
pkgrel=1
pkgdesc='A Framework for Bundlers, used by librarian-puppet.'
arch=(any)
url='https://github.com/voxpupuli/librarian'
license=('MIT')
depends=(ruby ruby-thor)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('7b58de3ce3f6169b4ec5a5174f141dbcc36ca5459cd1d077f23b990ec324bb2b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
