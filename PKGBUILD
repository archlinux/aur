# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Thanks go to jthan (<jonathan (at) jonathandemasi (dot) com>) for fixing install-mbr.c.
# ...now, if only I could teach him how to use patch(1).
# Contributor:	Gergely	Tamas	<mfa.kfki.hu: dice>
# Past maintainer:	Jesse	Jaara	<gmail.com: jesse.jaara>

pkgname=mbr
pkgver=1.1.11
pkgrel=7
pkgdesc="A replacement master boot record"
url="http://www.chiark.greenend.org.uk/~neilt/mbr/"
license=("GPL")
makedepends=('bin86')
arch=('i686' 'x86_64')
source=("http://www.chiark.greenend.org.uk/~neilt/mbr/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}-${pkgver}.tar.gz.sig"
	"install-mbr.patch"
	"install-mbr.patch.sig")
sha512sums=('27637b7c37be22ec7947b73684156a38c76dd1d37fad12133dd614ac4b98b578b30a758e6179a7cd62f6044dde2dce19a1e28234aa4bd0d848ef97b44d6cd8f9'
            'SKIP'
	    '3f9eaf638d65c72817685bf992ffeb062af65671dbe500964f0fcf31e4acca956161cf30d260da9ecf2a1d5d86356f805313327f1365438e06c5cbaeb5179be7'
	    'SKIP')

prepare() {

  cd "${srcdir}/${pkgname}-${pkgver}"
  patch < ${srcdir}/install-mbr.patch

}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --sbindir=/usr/bin

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

