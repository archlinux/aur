# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Past maintainer: Fina Miñano <cicely@algofacil.info>
# Contributor: Fina Miñano <cicely@algofacil.info>
pkgname=mindi
pkgver=3.0.1
pkgrel=2
pkgdesc="Create bootable disks or CD image with your system files, to allow system maintenance"
arch=('i686' 'x86_64')
url="http://www.mondorescue.org/"
license=('GPL2')
backup=('etc/mindi/mindi.conf' 'etc/mindi/deplist.txt' 'etc/mindi/deplist.d/addon.conf')
depends=('bzip2>=0.9' 'udev>=173' 'cdrkit' 'ncurses' 'binutils' 'gawk' 'dosfstools' 'mindi-busybox>=1.7.3' 'parted' 'perl' 'mtools' 'which' 'grep>=2.5' 'cpio' 'inetutils')

# Not on all systems
#conflicts=(bonnie++)

source=("ftp://ftp.mondorescue.org/src/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('397f25484d38eb465bbb074d5e75cb0aff0c32ebad0ec28e002edfd915a8593c36f1ae4b7aa7038bf4d6d1c998e175fc78bea51b55886d0755dcecb3393326bf'
            'SKIP')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export DONT_RELINK=1
  export HEAD=${pkgdir}
  export PREFIX=/usr
  export CONFDIR=/etc
  export DOCDIR=/usr/share/doc
  export LIBDIR=/usr/lib
  export CACHEDIR=/var/cache/${pkgname}
  export PKGBUILDMINDI="true"  

  sed -i -e 's@/sbin@/bin@g' install.sh
  mkdir -p ${pkgdir}/usr/lib/mindi/rootfs/usr/bin
  ./install.sh 
  DOCDIR_INST=${pkgdir}${DOCDIR}/${pkgname}
  install -d ${DOCDIR_INST}
  install -m 644 ChangeLog AUTHORS COPYING README README.* TODO INSTALL NEWS ${DOCDIR_INST}
}

