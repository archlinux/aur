# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=stf
pkgver=3.4.1
pkgrel=3
pkgdesc='Web application for controlling and managing Android devices'
arch=(i686 x86_64)
url=https://openstf.io
license=(Apache)
depends=(android-tools 'nodejs<10' rethinkdb zeromq)
makedepends=(npm python2 graphicsmagick protobuf yasm)
options=(!strip)
source=(https://registry.npmjs.org/stf/-/stf-$pkgver.tgz)
noextract=(stf-$pkgver.tgz)
sha512sums=('75dca7e86a16a1ba12cded9249130a8c31aee22d33d71690d0a3790624089c0c9eb885c6899ca0641c5e26c3b4d86ad027cf2b09be62f49491faa330c81cfa07')

package() {
  npm i -g --prefix="$pkgdir"/usr $pkgname-$pkgver.tgz

  cd "$pkgdir"/usr

  # Fix permissions
  find . -exec chown -h 0:0 {} +
  find . -type d -exec chmod 755 {} +

  install -Dm 644 lib/node_modules/stf/README.md -t share/doc/stf
}
