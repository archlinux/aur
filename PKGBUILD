# Maintainer: aksr <aksr at t-com dot me>
# Contributor: karu1 <.1me.io7@gmail.com>

pkgname=rar2fs
pkgver=1.29.6
_unrarver=6.2.6
pkgrel=1
pkgdesc="Fuse file system for reading Rar archives"
arch=("i686" "x86_64")
license=("GPL3")
url="https://github.com/hasse69/rar2fs"
url="https://hasse69.github.io/rar2fs/"
depends=("fuse2" "libunrar")
source=("https://github.com/hasse69/rar2fs/releases/download/v$pkgver/rar2fs-$pkgver.tar.gz"
        "http://www.rarlab.com/rar/unrarsrc-${_unrarver}.tar.gz")
md5sums=('3e698f3b21e2ecfec39d74596c0e129a'
         '6c68f2bbcd9f06f9d37801ad4256e680')
sha1sums=('a7b79c04dafd79a3d85b89bb456359a4d79cb2b6'
          '501edda1b33c85b262982502968fbb96f05640b1')
sha256sums=('ba3a0b649f2322498d54168f03d2e8bca9b1c96d70d0d97d83ea336a7525d4cb'
            '0c2d4cbc8b34d0e3bec7b474e0f52bbcc6c4320ec089b4141223ee355f63c318')
sha512sums=('c046f51c7047c3d04c3e9d1b69c72c019c32c70f83776f8179b608e8c21a7a3edfd4229434285a4234fd65ad48ffd5cbae3b2fa2d285cecf1a84a3a30ab3c256'
            'c2dc4176426dd73cfcbb3af135f8eb44ad455ea29e0e45b23e6987dd33658530444e35598fd5ffae0e27a466a9e01daf4b167edd69a686b62fd3b5a0f3bf81f6')

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
