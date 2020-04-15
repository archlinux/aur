# Maintainer: DDoSolitary <DDoSolitary@gmail.com>
# Contributor: Rhys Davies <rhys@johnguant.com>

_gemname=gh
pkgname=ruby-$_gemname
pkgver=0.16.0
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
sha512sums=('d2d4b70af21725b97cf85a1a0f63eb8fe43969b3d3138bc211ffbc30de646c527e7e61c54606706e813629585ac02a6700826b93bf12341624a6682980c85a59')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  sed -i 's/~>/>=/g' "$pkgdir/$_gemdir/specifications/$_gemname-$pkgver.gemspec"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
