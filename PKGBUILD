# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=rubocop-performance
pkgname=ruby-${_gemname}
pkgver=1.11.4
pkgrel=1
pkgdesc="An extension of RuboCop focused on code performance checks"
arch=(any)
depends=(ruby ruby-rubocop ruby-rubocop-ast)
checkdepends=(ruby-rspec)
makedepends=(rubygems ruby-rdoc git)
url=https://docs.rubocop.org/rubocop-performance
license=(MIT)
options=(!emptydirs)
source=(git+https://github.com/rubocop/${_gemname}.git?tag=v${pkgver})
sha256sums=('SKIP')

build() {
  cd $_gemname
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname
  rspec
}

package() {
  cd $_gemname
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
