# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=minitest-reporters
pkgname=ruby-$_gemname
pkgver=1.4.3
pkgrel=2
pkgdesc="Extend Minitest through simple hooks"
arch=(any)
url=https://github.com/minitest-reporters/minitest-reporters
license=(MIT)
depends=(ruby ruby-ansi ruby-builder ruby-minitest ruby-ruby-progressbar)
checkdepends=(ruby-bundler ruby-rake ruby-rubocop ruby-maruku)
makedepends=(git rubygems ruby-rdoc)
options=(!emptydirs)
source=(git+https://github.com/minitest-reporters/minitest-reporters.git?tag=v$pkgver)
sha256sums=('SKIP')

prepare() {
  cd ${_gemname}
  sed -i 's|~>|>=|g' ${_gemname}.gemspec
}

build() {
  cd ${_gemname}
  gem build ${_gemname}.gemspec
}

check() {
  cd ${_gemname}
  rake
}

package() {
  cd ${_gemname}
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
