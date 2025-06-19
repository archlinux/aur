# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Alberto Redondo <albertomost at gmail dot com>

_gemname=version_gem
pkgname=ruby-$_gemname
pkgver=1.1.8
pkgrel=1
pkgdesc='Enhance that VERSION! Sugar for boring Version modules.'
arch=('any')
url='https://github.com/pboling/version_gem'
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('a964767ecbe36551b9ff2e59099548c27569f2f7f94bdb09f609d76393a8e008')
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
