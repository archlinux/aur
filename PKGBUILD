# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: farwayer <farwayer@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_gemname=parser
pkgname=ruby-${_gemname}
pkgver=2.7.2.0
pkgrel=1
pkgdesc="A Ruby parser written in pure Ruby."
arch=('any')
depends=(ruby ruby-ast)
makedepends=(rubygems ruby-rdoc)
url="https://rubygems.org/gems/${_gemname}"
license=('MIT')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
options=(!emptydirs)
noextract=($_gemname-$pkgver.gem)
sha256sums=('dfd0e872fe3ca330cdbb9222ab14f0a2e254749f78344b791143510f4cadefb8')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
