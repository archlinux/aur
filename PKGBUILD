# Maintainer: Mikhail f. Shiryaev <mr point felixoid a gmail dot com>

_gemname=puppet-strings
pkgname=ruby-${_gemname}
pkgver=2.3.1
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
sha256sums=('e3c81c0d52920dea4e77c721f291dd1a00ff03c3783c051b5602cb872086f9e2')

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
