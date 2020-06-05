# Maintainer: aksr <aksr at t-com dot me>
pkgname=rar2fs
pkgver=1.29.0
_unrarver=5.9.2
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
md5sums=('13b518a6be0863f1fd10ce4c14bc2c30'
         '67148484b431aea1329653b885ffcdf2')
sha1sums=('66be422ec7436bd2ffd7ff1fa190d3895da7ad2b'
          '4ad31c3d18eb80f7e42f2542fde1cd6213e8ea5a')
sha256sums=('1bc42aa0516b276d24bdd8b69c53973fddd58bbd4e2c0d293c84912d14fdc6c7'
            '73d3baf18cf0a197976af2794a848893c35e7d42cee0ff364c89d2e476ebdaa6')
sha512sums=('199767cf22a11a7afd53318d471138ed1d82b92dc6d4e0d20094262a2f2d8f9c03ac6b47ceff8318923e01228b33f12684b1664e4b1c28bf43fb0d81f3d044c5'
            'e48dd3327d57522aa676e8fd6e29b7133ee9921eb1525d90ddedc61716ecfeefb51a7eb3a667f4f81f21a5ce8654727617d33463a5b6a40a7bc32252fa9f25df')

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

