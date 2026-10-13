# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=hfsfuse
pkgver=0.469
pkgrel=1
pkgdesc="A FUSE filesystem for HFS+ filesystems"
arch=('x86_64')
url="https://github.com/0x09/hfsfuse"
license=('MIT' 'BSD')
depends=('fuse3' 'libarchive' 'libutf8proc' 'zlib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/0x09/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('b540390f9476e53e25065db1cb0fce821d2a1020c774d8824157d3d5464b1b9563b4405381a033a0798d789d88bf04c4a0b88cca5674e87bb7d60649c4389665')


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
