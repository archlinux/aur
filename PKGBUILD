# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=bump
pkgname=ruby-$_gemname
pkgver=0.10.0
pkgrel=1
pkgdesc="A gem to simplify the way you build gems"
arch=(any)
url=https://github.com/gregorym/bump
license=(MIT)
depends=(ruby)
makedepends=(ruby-rdoc rubygems)
options=(!emptydirs)
source=(git+https://github.com/gregorym/bump.git?tag=v$pkgver)
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

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
