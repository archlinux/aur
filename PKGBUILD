# Contributor: Alberto Redondo <albertomost at gmail dot com>

_gemname=version_gem
pkgname=ruby-$_gemname
pkgver=1.1.4
pkgrel=1
pkgdesc='Versions are good. Versions are cool. Versions will win.'
arch=('any')
url='https://github.com/pboling/version_gem'
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('c69752c6d6a9446ad21a030661a988ba10ba05c1ad249532332ecc7efa534621')
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
