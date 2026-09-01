# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=hfsfuse
pkgver=0.451
pkgrel=1
pkgdesc="A FUSE filesystem for HFS+ filesystems"
arch=('x86_64')
url="https://github.com/0x09/hfsfuse"
license=('MIT' 'BSD')
depends=('fuse3' 'libarchive' 'libutf8proc' 'zlib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/0x09/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('9e4c75d4b0e0f52e32679e9f546bfe5b7f6ee6c5032b00c825b9cad130770e50ae68eee941c40ab7eb8d0815fea35f2d9d02e771da820dd901b24db661d9060e')


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
