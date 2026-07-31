# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=hfsfuse
pkgver=0.425
pkgrel=1
pkgdesc="A FUSE filesystem for HFS+ filesystems"
arch=('x86_64')
url="https://github.com/0x09/hfsfuse"
license=('MIT' 'BSD')
depends=('fuse3' 'libarchive' 'libutf8proc' 'zlib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/0x09/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('0a2955fc529dadc2e5a27b6a115897f967631e2c7ee4e3df57179552aafb3dd8ca0ce920aef79598076b179c7511f789100e3c1759f285f4b394d39daeab1662')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  make WITH_UTF8PROC=local WITH_ZLIB=local
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" prefix=/usr install

  ln -s hfsfuse "$pkgdir/usr/bin/mount.hfsplus"
  ln -s hfsfuse "$pkgdir/usr/bin/mount.fuse.hfsplus"

  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
