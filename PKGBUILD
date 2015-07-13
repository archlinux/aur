# Maintainer: Adrian Perez <adrian@perezdecastro.org>
pkgname=fusefat
pkgver=0.3a
pkgrel=2
pkgdesc="User space implementation of the FAT file sustem using FUSE"
arch=(x86_64 i386)
url="http://sourceforge.net/projects/libfat/"
license=('GPL')
depends=('fuse' 'glib2')
source=("http://downloads.sourceforge.net/project/libfat/libfat/$pkgver/libfat-$pkgver.tar.gz")
sha512sums=('c9257df5f9dab7ed99e83d6ca7cd6df4dca658a33062d69be8c48a6e38a39d3f7fec592a7c6c86b22816d681942647578566fbf457a5ebe08e029689d38099cc')

# Weird directory name in the tarball contents...
_pkgdirname=fuse-umfuse-fat-0.1

build() {
  cd "${srcdir}/${_pkgdirname}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make fusefat
}

package() {
  cd "$srcdir/$_pkgdirname"
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" fusefat
}

# vim:set ts=2 sw=2 et:
