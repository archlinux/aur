# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_gemname=gemoji
pkgname=ruby-$_gemname
pkgver=4.0.0.rc3
pkgrel=1
pkgdesc="Character information and metadata for Unicode emoji"
arch=(any)
url=https://github.com/github/gemoji
license=(MIT)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-i18n ruby-minitest)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('81d86b6889eb3c9831f9a4be3931dcd957fe289eeee5132848aa6749fcb01c7a')

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
