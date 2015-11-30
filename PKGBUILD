# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-radosgw
pkgname=ruby-$_gemname
pkgver=0.0.4
pkgrel=1
pkgdesc='Fog backend for provisioning users on Ceph Radosgw - the Swift and S3 compatible REST API for Ceph.'
arch=(any)
url='https://github.com/fog/fog-radosgw'
license=(MIT)
depends=(ruby ruby-fog-json ruby-fog-xml ruby-fog-core)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('49e81f23af1ba95626437c2be0081c3b769253036ba4dd9c54cb25a03f184ac9bc0c6c1bd09d8a7c48804c9113e0114e1ef2e2647018dbb9c62768d7b8a5262f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
