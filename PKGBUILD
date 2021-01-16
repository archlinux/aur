# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=netrc
pkgname=ruby-$_gemname
pkgver=0.11.0
pkgrel=1
pkgdesc="Reads and writes netrc files"
arch=(any)
url=https://github.com/heroku/netrc
license=(MIT)
options=(!emptydirs)
depends=(ruby)
makedepends=(git rubygems ruby-rdoc)
source=(git+https://github.com/heroku/netrc.git?tag=v$pkgver)
sha256sums=('SKIP')

build() {
  cd ${_gemname}
  gem build ${_gemname}.gemspec
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

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

# vim: set ts=2 sw=2 et:
