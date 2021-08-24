# Maintainer: aksr <aksr at t-com dot me>
# Contributor: karu1 <.1me.io7@gmail.com>

pkgname=rar2fs
pkgver=1.29.5
_unrarver=6.0.7
pkgrel=1
pkgdesc="Fuse file system for reading Rar archives"
arch=("i686" "x86_64")
license=("GPL3")
url="https://github.com/hasse69/rar2fs"
url="https://hasse69.github.io/rar2fs/"
depends=("fuse2" "libunrar")
source=("https://github.com/hasse69/rar2fs/releases/download/v$pkgver/rar2fs-$pkgver.tar.gz"
        "http://www.rarlab.com/rar/unrarsrc-${_unrarver}.tar.gz")
md5sums=('b2dca33f6a963ac860e4e4921a4d574e'
         'de5017a63a610cb82dba7d33bd826fb6')
sha1sums=('9df539a72ad22b6333ffb9ff93f078069f86464a'
          '041a36ea448c73555ab94070add7dfaa0ef62bb0')
sha256sums=('a56e9f2fd3d5037087b8405cff85ce7ffb74a904176f33f55b7bd15117cff2be'
            'a7029942006cbcced3f3b7322ec197683f8e7be408972ca08099b196c038f518')
sha512sums=('78962d614d66eeb09c013212d8bd373907d8a55489d9bc544f43ba1f34989cd777bba38a6af5899fea0b01e4cfdc0ee18462776e2d4cc529e05d5c6d30a899bf'
            '2c50d1f58f5189e59dad36eb25aa50a34572f583242e624846c9791c5609e83d4ee76314d785771fe514ec3378749dcb86e4c97a8d2a3ab7b469df49a5c5f412')

build() {
  cd "$srcdir/unrar"
  make lib
  echo "Starting Build $pkgname source"
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin --with-unrar=../unrar
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
  install -Dm644 AUTHORS ChangeLog COPYING NEWS rarconfig.example README -t "${pkgdir}/usr/share/doc/${pkgname}"
}
