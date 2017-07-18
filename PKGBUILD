# Maintainer: Mikołaj Chwalisz <chwalisz@tkn.tu-berlin.de>

pkgname=geni-tools
pkgver=2.10
pkgrel=1
pkgdesc="Omni is a GENI command line tool for reserving resources at GENI aggregate managers via the GENI AM API using user accounts issued by a GENI clearinghouse."
arch=(any)
url="https://github.com/GENI-NSF/geni-tools"
license=('MIT')
depends=("python2" "python2-dateutil" "python2-pyopenssl" "python2-m2crypto")
source=("https://github.com/GENI-NSF/$pkgname/archive/v$pkgver.tar.gz"
        "omni.run"
        "omni-configure.run"
        )
sha256sums=('add9bf5a8fe0b4e9d01ee26a99c6f58d1b34b2c88077690ce5165fc3121b8e1e'
            'b60b09ef7a9bf22b3daf09fef1c4b8d604b343149846a29aae3a4805a3402687'
            '07d56412fb374c976309df9d8f549438fa2d2c320c7b2aac06f8e7c8fee8f2c0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/opt/$pkgname PYTHON=python2
  make
}

package() {
  install -m 755 -D "omni.run" "$pkgdir/usr/bin/omni"
  install -m 755 -D "omni-configure.run" "$pkgdir/usr/bin/omni-configure"
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
