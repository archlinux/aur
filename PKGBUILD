# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: realitygaps <realitygaps at yahoo dot com>

_gemname=parseconfig
_commit=f76be450d8205b628786018c0f3a460cc1a3ecfe
pkgname=ruby-$_gemname
pkgver=1.1.2
pkgrel=1
pkgdesc="Ruby Config File Parser for Standard Unix/Linux Type Config Files"
arch=(any)
url=https://github.com/datafolklabs/ruby-parseconfig
license=(MIT)
options=(!emptydirs)
depends=(ruby)
makedepends=(rubygems ruby-rdoc)
checkdepends=(ruby-rspec)
source=(${url}/archive/${_commit}.tar.gz)
sha256sums=('35e4a53e67c8ce68b9245faedc7eb2c88b0783e2db51e901aa37b36d2bd7ac8d')

build() {
  cd $pkgname-$_commit
  gem build ${_gemname}.gemspec
}

check() {
  cd $pkgname-$_commit
  make test
}

package() {
  cd $pkgname-$_commit
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
