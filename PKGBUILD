# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: farwayer <farwayer at gmail dot com>

_gemname=rubocop
pkgname=ruby-${_gemname}
pkgver=1.16.0
pkgrel=1
pkgdesc="A Ruby static code analyzer and formatter"
arch=(any)
depends=(
  ruby
  ruby-parallel
  ruby-parser
  ruby-rainbow
  ruby-regexp_parser
  ruby-rexml
  ruby-rubocop-ast
  ruby-ruby-progressbar
  ruby-unicode-display_width
)
makedepends=(rubygems ruby-rdoc)
url=https://rubocop.org
license=(MIT)
options=(!emptydirs)
source=(https://github.com/rubocop-hq/rubocop/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('c8da71c1013b8ef46a94ad6808b2e222ddfda5b1d56ad24e8508e6563e4345c3')

prepare() {
  cd $_gemname-$pkgver
  sed -i 's|~>|>=|g' ${_gemname}.gemspec
}

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
}

# vim: set ts=2 sw=2 et:
