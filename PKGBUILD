# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=rexml
pkgname=ruby-${_gemname}
pkgver=3.2.4
pkgrel=2
pkgdesc="An XML toolkit for Ruby"
arch=(any)
depends=(ruby)
makedepends=(rubygems ruby-rdoc)
url=https://github.com/ruby/rexml
license=(BSD)
options=(!emptydirs)
source=(https://github.com/ruby/rexml/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('808a138b2118079e5d1a020976f5e843e915d1331721bf05c4a0deaf95296da8')

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

package() {
  cd $_gemname-$pkgver
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
