# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=rubocop-rake
pkgname=ruby-${_gemname}
pkgver=0.6.0
pkgrel=1
pkgdesc="A RuboCop plugin for Rake"
arch=(any)
depends=(ruby ruby-rubocop)
checkdepends=(ruby-bundler ruby-rspec ruby-rubocop-rspec ruby-rake)
makedepends=(rubygems ruby-rdoc git)
url=https://github.com/rubocop/rubocop-rake
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
  rake spec
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
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
