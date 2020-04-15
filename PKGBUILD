# Maintainer: DDoSolitary <DDoSolitary@gmail.com>
# Contributor: Rhys Davies <rhys@johnguant.com>

_gemname=gh
pkgname=ruby-$_gemname
pkgver=0.17.0
pkgrel=1
pkgdesc='layered github client'
arch=(any)
url='https://github.com/travis-ci/gh'
license=(MIT)
depends=(ruby ruby-faraday ruby-backports ruby-multi_json ruby-addressable ruby-net-http-persistent ruby-net-http-pipeline)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('02b022c6f3dc8e8661a80a1debfb723880fbd9f9a0b71c56bb62b7640243450d4a66d1f3f78c23e78460a55b2a7ad484a82a677895b6569d6ae50c318fa4cab7')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  sed -i 's/~>/>=/g' "$pkgdir/$_gemdir/specifications/$_gemname-$pkgver.gemspec"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
