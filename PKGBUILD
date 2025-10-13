# Contributor: Alberto Redondo <albertomost at gmail dot com>
# Contributor: Mario Finelli <mario at finel dot li>
# Contributor: eagletmt <eagletmt at gmail dot com>

_gemname=oauth
pkgname=ruby-$_gemname
pkgver=1.1.2
pkgrel=1
pkgdesc='OAuth for Ruby'
arch=('any')
url='https://github.com/oauth-xx/oauth-ruby'
license=('MIT')
depends=('ruby-oauth-tty' 'ruby-snaky_hash' 'ruby-version_gem')
makedepends=('ruby-rdoc')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('e29a96f9accd2b269caa5941d82f37d484ffe5da777a699feb766c51c856fb86')
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
