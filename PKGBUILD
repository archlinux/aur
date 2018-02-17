# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: eagletmt <eagletmt at gmail dot com>

_gemname=oauth
pkgname=ruby-$_gemname
pkgver=0.5.4
pkgrel=1
pkgdesc='OAuth Core Ruby implementation.'
arch=('any')
url='https://github.com/oauth-xx/oauth-ruby'
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('3e017ed1c107eb6fe42c977b78c8a8409249869032b343cf2f23ac80d16b5fff')
options=(!emptydirs)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
