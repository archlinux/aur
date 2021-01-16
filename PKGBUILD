# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=jaro_winkler
pkgname=ruby-${_gemname}
pkgver=1.5.4
pkgrel=2
pkgdesc="Ruby & C implementation of Jaro-Winkler distance algorithm which supports UTF-8 string"
arch=(i686 x86_64)
depends=(ruby)
makedepends=(rubygems ruby-rdoc)
url=https://github.com/tonytonyjan/jaro_winkler
license=(MIT)
options=(!emptydirs)
source=(https://github.com/tonytonyjan/jaro_winkler/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('290b0765be8f35eabcebc5623006683803831d99d6c3b6aef0c73571e9af965b')

build() {
  cd ${_gemname}-${pkgver}
  gem build ${_gemname}.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
