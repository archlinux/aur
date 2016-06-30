# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Contributor: Jochen Schalanda <jochen+aur (at) schalanda.name>
pkgname=debianutils
pkgver=4.8
pkgrel=1
pkgdesc="Miscellaneous utilities specific to Debian"
arch=('i686' 'x86_64')
url="http://packages.qa.debian.org/d/debianutils.html"
license=('GPL')
depends=('run-parts' 'which')
source=("http://ftp.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz"
	"${pkgname}_${pkgver}.tar.xz.sig")
sha512sums=('25119e4079892f80d0780ba167a58b789769472611d76e5974df7f5ccd22c95cbbb3ae60f6d23937b968b091eeb835c009071b7ec7ab892a6c7fa9cf119b9b23'
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
