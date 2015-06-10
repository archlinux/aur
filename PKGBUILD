# Maintainer: ianux <ianux at free dot fr>
# Contributor: priyank

pkgname=ices0
_pkgname=ices
pkgver=0.4
pkgrel=1
pkgdesc="Source client for broadcasting in MP3 format to an Icecast2 server"
arch=('i686' 'x86_64')
license=('GPL')
url="http://icecast.org/ices.php"
depends=('libxml2' 'lame' 'libvorbis' 'libshout' 'python2' 'perl')
source=(http://downloads.us.xiph.org/releases/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('d31450c4011561dae0229f071cb41cb6')
sha1sums=('427f39d3ac4a45e84222c8f8a4007767a754749c')
options=('!docs')
install=$pkgname.install

build() {
  cd ${srcdir}/$_pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/usr/share/$pkgname -mandir=/usr/share \
    --with-python=/usr/bin/python2 --without-faad --without-flac
  make
}

package() {
  cd ${srcdir}/$_pkgname-$pkgver
  make DESTDIR=${pkgdir} install
  # Rename files to avoid conflict with ices2
  mv ${pkgdir}/usr/bin/ices ${pkgdir}/usr/bin/ices0
  mv ${pkgdir}/usr/share/man1/ices.1 ${pkgdir}/usr/share/man1/ices0.1
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/$pkgname/COPYING
}
