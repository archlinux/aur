# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Alberto Redondo <albertomost at gmail dot com>

_gemname=version_gem
pkgname=ruby-$_gemname
pkgver=1.1.9
pkgrel=1
pkgdesc='Enhance that VERSION! Sugar for boring Version modules.'
arch=('any')
url='https://github.com/pboling/version_gem'
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('0c1a0962ae543c84a00889bb018d9f14d8f8af6029d26b295d98774e3d2eb9a4')
options=(!emptydirs)

package() {

  local _gemdir="$(ruby -e 'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

}
