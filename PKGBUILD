# Maintainer: aksr <aksr at t-com dot me>
pkgname=rar2fs
pkgver=1.29.1
_unrarver=5.9.4
pkgrel=1
pkgdesc="Fuse file system for reading Rar archives"
arch=("i686" "x86_64")
license=("GPL3")
url="https://github.com/hasse69/rar2fs"
url="https://hasse69.github.io/rar2fs/"
depends=("fuse2" "libunrar")
makedepends=("libunrar")
source=("https://github.com/hasse69/rar2fs/releases/download/v$pkgver/rar2fs-$pkgver.tar.gz"
        "http://www.rarlab.com/rar/unrarsrc-$_unrarver.tar.gz")
md5sums=('084b65e49db239f6e210d08eb92da237'
         'b4aa9106e8820b89f11a1c2143a2815b')
sha1sums=('d900922ab217325cfc3bd57bb4b0a9fb833e1f48'
          '7c907ede1aded10449bb5a766d268d909ea51845')
sha256sums=('664d8b3893cb37fd0c46f7cf9d34623f8c8a23891d6a57408f40ec0fa3ac83b3'
            '3d010d14223e0c7a385ed740e8f046edcbe885e5c22c5ad5733d009596865300')
sha512sums=('c0cb4cca59e6adb450350a9730500bf9c569bb9ad835af0726ff05876a7a02c43e905293cc5582239b7a2564bf46bd02e6122934e0ad8c1785c326dbeff9c096'
            '4c026bc12c38314c7df6e1b2f296be681fffa4ba525e378809063519cb5d51889fe8d3cbce16e802023354f02b45b1bcc672b79a6fa81b4baa13a374ce22c8f1')

build() {
  cd "$srcdir/unrar"
  make lib
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin --with-unrar=../unrar
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}
