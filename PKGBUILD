# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=sorted_set
pkgname=ruby-${_gemname}
pkgver=1.0.3
pkgrel=1
pkgdesc="SortedSet for Ruby"
arch=(any)
depends=(ruby ruby-set ruby-rbtree)
checkdepends=(ruby-bundler ruby-rake ruby-test-unit)
makedepends=(git rubygems ruby-rdoc)
url=https://github.com/knu/sorted_set
license=(BSD)
options=(!emptydirs)
source=(git+https://github.com/knu/sorted_set.git?tag=v${pkgver})
sha256sums=('SKIP')

build() {
  cd $_gemname
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname
  rake
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
