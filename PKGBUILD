# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: Xyne <xyne at archlinux dot org>

pkgname=bindfs
pkgver=1.18.4
pkgrel=1
pkgdesc="A FUSE filesystem for mirroring a directory to another directory, similar to 'mount --bind', with permission settings."
arch=('i686' 'x86_64' 'armv6h' 'armv6l' 'armv7h')
url="http://bindfs.org/"
license=('GPL-2.0')
depends=('glibc' 'fuse3')
source=("http://bindfs.org/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1fedfcd082980180ccdd684478cc5308f4ea3fa541af12b5aef0b75fb0ec5b285009c4b783fc3cd5550505a83baf015e243f88eb322540d0f82e1952babc799a')


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
