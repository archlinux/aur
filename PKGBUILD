# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=regexp_property_values
pkgname=ruby-${_gemname}
pkgver=1.1.0
pkgrel=1
pkgdesc="Inspect property values supported by Ruby's regex engine"
arch=(x86_64)
depends=(ruby)
makedepends=(git rubygems ruby-rdoc)
url=https://github.com/jaynetics/regexp_property_values
license=(MIT)
options=(!emptydirs)
source=(git+https://github.com/jaynetics/regexp_property_values.git?tag=v${pkgver})
sha256sums=('SKIP')

build() {
  cd $_gemname
  gem build ${_gemname}.gemspec
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
