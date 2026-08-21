# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=hfsfuse
pkgver=0.444
pkgrel=1
pkgdesc="A FUSE filesystem for HFS+ filesystems"
arch=('x86_64')
url="https://github.com/0x09/hfsfuse"
license=('MIT' 'BSD')
depends=('fuse3' 'libarchive' 'libutf8proc' 'zlib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/0x09/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('73a8a0eb0980b2786d7eb1e7e08de62d8d8e5b1af8165e1ffd0f3af160be4ef3869b8004b96ee44264ec62b07f8c3e4cb42b45151d4d1fa324c3c9128fdee5ed')


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
