# Maintainer: aksr <aksr at t-com dot me>
pkgname=rar2fs
pkgver=1.28.0
_unrarver=5.8.5
pkgrel=1
pkgdesc="Fuse file system for reading Rar archives"
arch=("i686" "x86_64")
license=("GPLv3")
url="https://github.com/hasse69/rar2fs"
url="https://hasse69.github.io/rar2fs/"
depends=("fuse2" "libunrar")
makedepends=("libunrar")
source=("https://github.com/hasse69/rar2fs/releases/download/v$pkgver/rar2fs-$pkgver.tar.gz"
        "http://www.rarlab.com/rar/unrarsrc-$_unrarver.tar.gz")
md5sums=('abcbdb07b342f2e92ea6db55ba01ac6b'
         '0e0a2f75a8f4f0242ee8ebb58cbd37f9')
sha1sums=('3d2cd0798901bbba8becfaca4df0e01b30d60879'
          '686f5efc874b044a93a88f99e539ea6ccc1731c1')
sha256sums=('927287edb31f59a71e20b34acf8c792e08c850c6c1c54c4fd9d962323e8ca80a'
            'a725923a627bc8b3dd670a347b57701e1ad61f5f4e7b789d09244fb4b7f97b29')

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

