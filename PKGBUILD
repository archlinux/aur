# Maintainer: Michał Wojdyła < micwoj9292 at gmail >
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-google
pkgname=ruby-$_gemname
pkgver=1.19.0
pkgrel=1
pkgdesc='This library can be used as a module for fog or as standalone provider to use the Google in applications.'
arch=(any)
url='https://github.com/fog/fog-google'
license=(MIT)
depends=(ruby-fog-core ruby-fog-json ruby-fog-xml ruby-google-apis-compute_v1 ruby-google-apis-dns_v1 ruby-google-apis-iamcredentials_v1 ruby-google-apis-monitoring_v3 ruby-google-apis-pubsub_v1 ruby-google-apis-sqladmin_v1beta4 ruby-google-apis-storage_v1 ruby-google-cloud-env)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('c7dd4146a0f05a15d04277fadb3d182a876720b0830ad697a0d5e0bc52662b45714cd2f1c1f2e7bcf974cc0be0170315fa654dc0b9c2da86e63022b75da30234')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
