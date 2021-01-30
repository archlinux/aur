# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=oj
pkgname=ruby-$_gemname
pkgver=3.11.2
pkgrel=1
pkgdesc="The fastest JSON parser and object serializer"
arch=(i686 x86_64)
url=http://www.ohler.com/oj/
license=(MIT)
depends=(ruby)
makedepends=(rubygems ruby-rdoc)
source=(https://github.com/ohler55/oj/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
options=(!emptydirs)
sha256sums=('3a3852a546604fb6766d7e8bc16e622577c2d56661612f854754498fa4cc6124')

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

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
