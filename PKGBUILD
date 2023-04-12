# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_gemname=toml-rb
pkgname=ruby-$_gemname
pkgver=2.2.0
pkgrel=1
pkgdesc="A parser for TOML using Citrus library"
arch=(any)
url=https://github.com/emancu/toml-rb
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-citrus)
checkdepends=(ruby-rake ruby-minitest)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('a68a8d2632a6b5b91afe5348576f1e172cb6cd596c68ac87c815e61487c7d39e')

prepare() {
  cd $_gemname-$pkgver
  sed -i '/standard/d' ${_gemname}.gemspec
  sed -i '/standard/d' Rakefile
}

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-$pkgver
  rake
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

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
