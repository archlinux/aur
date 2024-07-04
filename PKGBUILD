# Maintainer: aksr <aksr at t-com dot me>
# Contributor: karu1 <.1me.io7@gmail.com>

pkgname=rar2fs
pkgver=1.29.6
_unrarver=6.2.6
pkgrel=1
pkgdesc="Fuse file system for reading Rar archives"
arch=("i686" "x86_64")
license=("GPL-3.0-only")
url="https://github.com/hasse69/rar2fs"
url="https://hasse69.github.io/rar2fs/"
depends=("fuse2" "glibc" "gcc-libs")
source=("rar2fs-v$pkgver.tar.gz"::"https://github.com/hasse69/rar2fs/archive/refs/tags/v$pkgver.tar.gz"
        "http://www.rarlab.com/rar/unrarsrc-${_unrarver}.tar.gz")
md5sums=('2c99478f4264f0c8ee2ab9398ebcbd66'
         '6c68f2bbcd9f06f9d37801ad4256e680')
sha1sums=('c37a99b1919797f55e0808e941e99c0499ba329e'
          '501edda1b33c85b262982502968fbb96f05640b1')
sha256sums=('c9c2381dea863bccf4e6ebfe1b4c9934e506644f321b1f664524cf467fa5e769'
            '0c2d4cbc8b34d0e3bec7b474e0f52bbcc6c4320ec089b4141223ee355f63c318')
sha512sums=('f76f8ee491e882398625dd865bf77df5aa91f0d92e3e721917c11a2c79dc90b28508e2e08f7d943ddc5411421c0dc56494f5fed20cdc8ee30cc6fadc8966e271'
            'c2dc4176426dd73cfcbb3af135f8eb44ad455ea29e0e45b23e6987dd33658530444e35598fd5ffae0e27a466a9e01daf4b167edd69a686b62fd3b5a0f3bf81f6')

build() {
  cd "$srcdir/unrar"
  make lib
  echo "Starting Build $pkgname source"
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -vfi
  ./configure --prefix=/usr --sbindir=/usr/bin --with-unrar=../unrar
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
  install -Dm644 AUTHORS ChangeLog COPYING NEWS rarconfig.example README -t "${pkgdir}/usr/share/doc/${pkgname}"
}
