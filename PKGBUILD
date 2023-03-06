# Maintainer: Mikhail f. Shiryaev <mr point felixoid a gmail dot com>

_gemname=puppet-strings
pkgname=ruby-${_gemname}
pkgver=3.0.1
pkgrel=1
pkgdesc="Puppet documentation via YARD"
arch=('any')
depends=(
  ruby
  ruby-yard
)
makedepends=(rubygems ruby-rdoc)
url="https://rubocop.readthedocs.io/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('APACHE')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=(528b5e1cfabfec96bf0b420f8609160b651a6b085c62e94109933b46a3ae0ae3)

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
