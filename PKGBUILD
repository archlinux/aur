# Maintainer: ParticleG <particle_g@outlook.com>

pkgname=ompweb
pkgver=0.3.3
pkgrel=1
pkgdesc='Web UI for the oh-my-pi coding agent'
arch=('x86_64')
url='https://github.com/kahme247/ompweb'
license=('MIT')
depends=('nodejs>=22.19.0' 'oh-my-pi')
options=('!strip' '!debug')
install=ompweb.install

_bundle_sha256='7794807116cb37d49c9e6cbc9e802b7e7b593245460c3126b8dfabb75cedce7b'
_bundle="$pkgname-$pkgver-x86_64.tar.gz"
source=(
  "$_bundle::https://github.com/ParticleG/ompweb/releases/download/bundle-v$pkgver-$_bundle_sha256/$_bundle"
  'ompweb@.service'
)
sha256sums=(
  "$_bundle_sha256"
  'f39d3111d2767289dfd19ff48511004ae9d45fec7193c61a7d2349bd1a9fa65d'
)

package() {
  install -d "$pkgdir/usr/lib/node_modules/@kahme247"
  cp -a "$srcdir/ompweb" \
    "$pkgdir/usr/lib/node_modules/@kahme247/ompweb"

  install -d "$pkgdir/usr/bin"
  ln -s "../lib/node_modules/@kahme247/ompweb/bin/omp-web.js" \
    "$pkgdir/usr/bin/ompweb"

  install -Dm644 "$srcdir/ompweb@.service" \
    "$pkgdir/usr/lib/systemd/system/ompweb@.service"

  install -Dm644 \
    "$srcdir/ompweb/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
