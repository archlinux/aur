# Maintainer: aksr <aksr at t-com dot me>
pkgname=rar2fs
pkgver=1.27.2
_unrarver=5.7.1
pkgrel=2
pkgdesc="Fuse file system for reading Rar archives"
arch=("i686" "x86_64")
license=("GPLv3")
url="https://github.com/hasse69/rar2fs"
url="https://hasse69.github.io/rar2fs/"
depends=("fuse2" "libunrar")
makedepends=("libunrar")
source=("https://github.com/hasse69/rar2fs/releases/download/v$pkgver/rar2fs-$pkgver.tar.gz"
        "http://www.rarlab.com/rar/unrarsrc-$_unrarver.tar.gz")
md5sums=('3a5170d17df5b46ffd027f6ab1653d99'
         '1695c966688dd26f7ba34f6f9f279d0c')
sha1sums=('eddde08f4a5b77c5e5dddb2eb291a5a47d98e3e2'
          '56096808b6be7f6feb494d40ebc7c0c61fc3ea8c')
sha256sums=('2e9452751f7e2d349ed8ea525a62b00ab50504e15337f1bb162bf2cacfa88a55'
            'd208abcceecfee0084bb8a93e9b756319d906a3ac6380ee5d10285fb0ffc4d65')

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

