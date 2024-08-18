# Maintainer: aksr <aksr at t-com dot me>
# Contributor: karu1 <.1me.io7@gmail.com>

pkgname=rar2fs
pkgver=1.29.7
_unrarver=7.0.9
pkgrel=1
pkgdesc="Fuse file system for reading Rar archives"
arch=("i686" "x86_64")
license=("GPL-3.0-only")
url="https://github.com/hasse69/rar2fs"
url="https://hasse69.github.io/rar2fs/"
depends=(fuse2 glibc gcc-libs)
makedepends=(autoconf automake)
source=("rar2fs-v$pkgver.tar.gz"::"https://github.com/hasse69/rar2fs/archive/refs/tags/v$pkgver.tar.gz"
        "http://www.rarlab.com/rar/unrarsrc-${_unrarver}.tar.gz")
md5sums=('4da83c672c93a103f179e264c9a54236'
         'a18509f604f31cf7a73473ee97d08ce5')
sha1sums=('491cfcdea6676f2edc9ca4bb9a006d4bd76c01ce'
          '3aadbeaaf6cedc7b914e4c8673fa1a646417a070')
sha256sums=('a875d138b7ed7e3353b5de2f0c5ec02ef6a32c310fe3b07886bc95314d7875ba'
            '505c13f9e4c54c01546f2e29b2fcc2d7fabc856a060b81e5cdfe6012a9198326')
sha512sums=('938d86a7594f0d7d3cac9ccde28b02c39ca0540db5129af61976910a569881d87e0647126618a65a5afad5abc04d5eb5187cd007e64e89db2d24de517aeb0025'
            '4dff760bd69275dcd9bacac7a8fa9a6e68e2d047ea3775abc16a80d9a6e277b686153faafb1b711582d86eabfdf3254c601d9f585b28104dbd85ece4868876ed')

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
