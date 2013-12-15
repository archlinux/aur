pkgname=netkit-rwho-debian
pkgver=0.17
pkgrel=2
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="Remote who"
depends=('glibc')
conflicts=('netkit-rwho')
url="ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/"
install=rwhod.install
backup=(etc/conf.d/rwhod)
source=(http://ftp.de.debian.org/debian/pool/main/n/netkit-rwho/netkit-rwho_0.17.orig.tar.gz http://ftp.de.debian.org/debian/pool/main/n/netkit-rwho/netkit-rwho_$pkgver-12.diff.gz rwhod.rc rwhod.conf)
md5sums=('0f71620d45d472f89134ba0d74242e75' 'ccbb57e61d8594aa37c33cc906071ce1' '5ab5042d60e508658e0a676d13556acb' 'd052293ac9c851ba8093338c530b349e')

build() {
  cd $srcdir/netkit-rwho-$pkgver
  patch -Np1 -i ../netkit-rwho_$pkgver-12.diff
  ./configure --prefix=/usr --installroot=$pkgdir
  make || return 1
  mkdir -p $pkgdir/usr/{bin,sbin,man/man1,man/man8} $pkgdir/etc/rc.d
  make install || return 1
  mkdir -p $pkgdir/var/spool/rwho
  install -m755 $srcdir/rwhod.rc $pkgdir/etc/rc.d/rwhod || return 1
  install -m644 -D $srcdir/rwhod.conf $pkgdir/etc/conf.d/rwhod || return 1
}

# end of file #
