# Maintainer: DDoSolitary <DDoSolitary@gmail.com>
# Contributor: Rhys Davies <rhys@johnguant.com>

_gemname=gh
pkgname=ruby-$_gemname
pkgver=0.15.1
pkgrel=3
pkgdesc='layered github client'
arch=(any)
url='https://github.com/travis-ci/gh'
license=(MIT)
depends=(ruby ruby-faraday ruby-backports ruby-multi_json ruby-addressable ruby-net-http-persistent ruby-net-http-pipeline)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('1bc684cf9d6c2276920bfd9658828f20f49c4f8458dea147f5db14a5e93b3dcf6a57e19fecac9ca7896fee63f0a33c8f1474e9f03c2d9d662d408a55640b9100')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  sed -i 's/~>/>=/g' "$pkgdir/$_gemdir/specifications/$_gemname-$pkgver.gemspec"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
