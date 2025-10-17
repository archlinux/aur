# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: Xyne <xyne at archlinux dot org>

pkgname=bindfs
pkgver=1.18.3
pkgrel=1
pkgdesc="A FUSE filesystem for mirroring a directory to another directory, similar to 'mount --bind', with permission settings."
arch=('i686' 'x86_64' 'armv6h' 'armv6l' 'armv7h')
url="http://bindfs.org/"
license=('GPL-2.0')
depends=('glibc' 'fuse3')
source=("http://bindfs.org/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('bd59988ee0d458e980941dbdfcbb2e801684156dc6ac3c5ff6a2aa76c1042460bbf0229e5a9c8b513a7526360e864be62af240d5a27e74e35f4a7a8234bbe4ee')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh

  ./configure --prefix=/usr

  make CPUOPTIMIZATIONS="${CFLAGS}"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  ln -s bindfs "$pkgdir/usr/bin/mount.bindfs"
  ln -s bindfs "$pkgdir/usr/bin/mount.fuse.bindfs"

  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
