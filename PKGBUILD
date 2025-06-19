# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=snaky_hash
pkgname=ruby-$_gemname
pkgver=2.0.3
pkgrel=1
pkgdesc='A Hashie::Mash joint to improve #snake_life for everyone'
arch=('any')
url='https://gitlab.com/oauth-xx/snaky_hash'
license=('MIT')
depends=('ruby-hashie' 'ruby-version_gem')
makedepends=('ruby-rdoc')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('25a3d299566e8153fb02fa23fd9a9358845950f7a523ddbbe1fa1e0d79a6d456')
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
