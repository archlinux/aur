# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=hfsfuse
pkgver=0.435
pkgrel=1
pkgdesc="A FUSE filesystem for HFS+ filesystems"
arch=('x86_64')
url="https://github.com/0x09/hfsfuse"
license=('MIT' 'BSD')
depends=('fuse3' 'libarchive' 'libutf8proc' 'zlib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/0x09/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('71e9e0883b83945460bd222b83d5921d9124c37c657cd944415ef7a70788c748d80280e1b8c03a1195adc5097df3bac7f0dd1a428d74c1af6e4cc847d0c87a05')


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
