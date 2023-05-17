# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>

pkgname=fs2es-indexer
pkgver=0.6.0
pkgrel=2
arch=('any')
pkgdesc='File system indexer for Elasticsearch'
url='https://github.com/Ellerhold/fs2es-indexer'
depends=('python-elasticsearch' 'python-yaml')
makedepends=('python-setuptools' 'git')
backup=('etc/fs2es-indexer/config.yml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ellerhold/fs2es-indexer/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('cc55d6b79647671148fc5cdaf88cfdc2e132cb7572f7b5467ac48831045890296a6902b0f4c3341d44d5826fd89c02b717cbe5316953c0e25726927190db7ecd')

prepare() {
 cd $pkgname-$pkgver
 cat config.dist.yml | sed 's/library_version: 8/library_version: 7/' > config.yml
}

package() {
  cd $pkgname-$pkgver
  mkdir -p "$pkgdir/opt/fs2es-indexer"
  cp -r fs2es-indexer lib es-index-mapping.json "$pkgdir/opt/fs2es-indexer"
  mkdir -p "$pkgdir/etc/fs2es-indexer"
  cp {config,role}.yml "$pkgdir/etc/fs2es-indexer/"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  cp fs2es-indexer.service "$pkgdir/usr/lib/systemd/system/fs2es-indexer.service"
}
