# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=regexp_parser
pkgname=ruby-${_gemname}
pkgver=2.0.3
pkgrel=3
pkgdesc="A regular expression parser library for Ruby"
arch=(any)
depends=(ruby)
makedepends=(rubygems ruby-rdoc ragel ruby-rake ruby-bundler)
url=https://github.com/ammar/regexp_parser
license=(MIT)
options=(!emptydirs)
source=(https://github.com/ammar/regexp_parser/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('c8a5732ee6a4c39a7b30edbd40f7858cd6ce3febe08ee90fd2e23c4825f43b96')

build() {
  cd $_gemname-$pkgver
  rake ragel:rb
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
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
