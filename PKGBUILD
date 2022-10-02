# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Andrew Rabert <draje@nullsum.net>

_gemname=image_size
pkgname=ruby-${_gemname}
pkgver=3.1.0
pkgrel=1
pkgdesc="measure image size using pure Ruby"
arch=(any)
url=https://github.com/toy/image_size
license=(RUBY GPL)
depends=(ruby)
checkdepends=(ruby-rspec ruby-webrick)
makedepends=(git rubygems ruby-rdoc)
options=(!emptydirs)
source=(git+https://github.com/toy/image_size.git#tag=v$pkgver)
sha256sums=('SKIP')

build() {
  cd ${_gemname}
  gem build ${_gemname}.gemspec
}

check() {
  cd ${_gemname}
  rspec
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

  install -Dm0644 README.markdown "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.markdown \
    "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
