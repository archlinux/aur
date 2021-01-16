# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>

_gemname=parallel
pkgname=ruby-$_gemname
pkgver=1.20.1
pkgrel=1
pkgdesc="Ruby: parallel processing made simple and fast"
arch=(any)
url=https://github.com/grosser/parallel
license=(MIT)
depends=(ruby)
makedepends=(git rubygems ruby-rdoc)
options=(!emptydirs)
source=(git+https://github.com/grosser/parallel.git?tag=v$pkgver)
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

  install -Dm0644 MIT-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 Readme.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
