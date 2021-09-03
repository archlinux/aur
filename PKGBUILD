# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: cosarara <cosarara97@gmail.com>

_gemname=temple
pkgname=ruby-$_gemname
pkgver=0.8.2
pkgrel=1
pkgdesc="Template compilation framework in Ruby"
arch=(any)
url=https://github.com/judofyr/temple
license=(MIT)
depends=(ruby)
checkdepends=(ruby-rake ruby-bacon ruby-tilt ruby-erubi)
makedepends=(git rubygems ruby-rdoc)
options=(!emptydirs)
source=(git+https://github.com/judofyr/temple.git?tag=v$pkgver)
sha256sums=('SKIP')

build() {
  cd $_gemname
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname
  rake test
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

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGES "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
  install -Dm0644 EXPRESSIONS.md "$pkgdir/usr/share/doc/$pkgname/EXPRESSIONS.md"
}

# vim: set ts=2 sw=2 et:
