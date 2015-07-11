# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Maintainer: Oliver Kuster<olivervbk@gmail.com>

pkgname=hdup
pkgver=2.0.14
pkgrel=4
pkgdesc="The little, spiffy, backup tool"
arch=(i686 x86_64)
url="http://archive.miek.nl/projects/hdup/index.html"
license=('GPL2')
depends=('coreutils' 'mcrypt' 'openssh' 'gnupg' 'gzip' 'bzip2' 'lzop' 'glibc' 'glib2')
backup=('etc/hdup/hdup.conf')
source=(http://archive.miek.nl/projects/hdup2/$pkgname-$pkgver.tar.bz2)
md5sums=('7795ac9dd5a1ae40d330a54b6a6e91a3')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
  make
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  make DESTDIR=$pkgdir install

  chmod a+r $pkgdir/etc/hdup/hdup.conf
  chmod a+r $pkgdir/etc/hdup/postrun-warn-user

  mv $pkgdir/usr/{s,}bin
}
