# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: Xyne <xyne at archlinux dot org>

pkgname=bindfs
pkgver=1.18.2
pkgrel=1
pkgdesc="A FUSE filesystem for mirroring a directory to another directory, similar to 'mount --bind', with permission settings."
arch=('i686' 'x86_64' 'armv6h' 'armv6l' 'armv7h')
url="http://bindfs.org/"
license=('GPL-2.0')
depends=('glibc' 'fuse3')
source=("http://bindfs.org/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0b711c1078267c9188d857e8272c8bcee9a6e968987f1fb6c46c07f0e8bcccd4684b6970d3ecd9292ee3919787f8c518ca7a79bef8a4a05b45d3c9fb9f85bb24')


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
