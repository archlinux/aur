# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Contributor: Jochen Schalanda <jochen+aur (at) schalanda.name>
pkgname=debianutils
pkgver=4.7
pkgrel=3
pkgdesc="Miscellaneous utilities specific to Debian"
arch=('i686' 'x86_64')
url="http://packages.qa.debian.org/d/debianutils.html"
license=('GPL')
depends=('run-parts' 'which')
source=("http://ftp.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz"
	"${pkgname}_${pkgver}.tar.xz.sig")
sha512sums=('74110d194de8b6b61d40b133b97629520048a8fdedac349ec2031c793c0246526c1c7904e88098b4c2a121e5efba2d724924139ab1aca15d129a4d210f94a1aa'
            'SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  msg 'Remove files of "which" and "run-parts" package...'
  cd 
  find "${pkgdir}" -name which* -delete
  find "${pkgdir}" -name run-parts* -delete
}
