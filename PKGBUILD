# Maintainer: DDoSolitary <DDoSolitary@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=travis
pkgname=ruby-$_gemname
pkgver=1.8.12
pkgrel=1
pkgdesc='CLI and Ruby client library for Travis CI'
arch=(any)
url='https://github.com/travis-ci/travis.rb'
license=(MIT)
depends=(ruby ruby-backports ruby-faraday-0.17 ruby-faraday-middleware ruby-gh ruby-highline-1.6 ruby-launchy ruby-pusher-client ruby-typhoeus-0.6)
makedepends=('ruby-rdoc')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('146ad1301beb2f2348d2ddf8f53c235f67968e784ab7349bbb2d11044fca88d02b03dd893ca5576eed90de2607ad6851ece464900661ae9c27c1fc8467f68faf')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
