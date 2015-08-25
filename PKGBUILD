# Contributor: Andreas Schrafl <aschrafl@jetnet.ch>
# based on the work of Jaroslav Lichtblau <tu@dragonlord.cz>
# based on the work of KyAnh, http://kyanh.net/ <xkyanh@gmail.com>

pkgname=boxbackup-server
pkgver=0.11.1
pkgrel=0
pkgdesc="An open source, completely automatic on-line backup system for UNIX."
arch=('i686' 'x86_64')
url="http://boxbackup.org"
license=('BSD')
depends=('openssl' 'perl' 'zlib')
backup=('etc/boxbackup/bbstored.conf')
source=(http://www.boxbackup.org/svn/box/packages/boxbackup-${pkgver}.tgz  bbserver)

md5sums=('c4c4786a918a9c026f80833614c40a6b'
         '7a85ba0caf36febfb8e6871c45aa108e')

build() {
	cd ${srcdir}/boxbackup-${pkgver}

	./configure

	make -j1 build-backup-server

    cp ${srcdir}/boxbackup-${pkgver}/release/bin/bbstored/bbstored ${srcdir}/boxbackup-${pkgver}/parcels/boxbackup-${pkgver}-backup-server-linux-gnu/bbstored
    cp ${srcdir}/boxbackup-${pkgver}/release/bin/bbstoreaccounts/bbstoreaccounts ${srcdir}/boxbackup-${pkgver}/parcels/boxbackup-${pkgver}-backup-server-linux-gnu/bbstoreaccounts

  for f in \
    bbstored \
    bbstoreaccounts \
    bbstored-certs \
    bbstored-config \
    raidfile-config ;\
  do
      install -D -m755 \
        ${srcdir}/boxbackup-$pkgver/parcels/boxbackup-$pkgver-backup-server-linux-gnu/$f \
        ${pkgdir}/usr/bin/$f
  done

   install -D -m755 "${srcdir}/bbserver" "${pkgdir}/etc/rc.d/bbserver"
}
