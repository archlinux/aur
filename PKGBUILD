# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-radosgw
pkgname=ruby-$_gemname
pkgver=0.0.5
pkgrel=1
pkgdesc='Fog backend for provisioning users on Ceph Radosgw - the Swift and S3 compatible REST API for Ceph.'
arch=(any)
url='https://github.com/fog/fog-radosgw'
license=(MIT)
depends=(ruby ruby-fog-json ruby-fog-xml ruby-fog-core)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('66ea63f767b1cff9e3e631f4fb7c28a69e415871ada6062fda6f6489334ef26227a6f0a5a63893a82f5ee6699a7d498fab94c1653b11e59482cb70df00e0246c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
