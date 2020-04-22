# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Past maintainer: F. Miñano <cicely@algofacil.info>
# TODO: CC=musl-gcc instead?
pkgname=mindi-busybox
pkgver=1.25.1
pkgrel=1
pkgdesc="This package provides a busybox version suited for Mindi"
arch=('i686' 'x86_64')
url="http://www.mondorescue.org/"
license=('GPL')
depends=(gcc)

#There are two official mirrors. If one is not working try the other. The muskokamug.org seems faster.
source=("ftp://ftp.mondorescue.org/src/${pkgname}-${pkgver}.tar.gz"
	"glibc_stime.patch"
	"${pkgname}-${pkgver}.tar.gz.sig"
	"glibc_stime.patch.sig")
sha512sums=('56cfa5c95a2527022884e3ac7bcfe43cb95df12f162f2c1988003763d30dacfc3215ff87ffd11712e60114d390d211d9da4adf4da25456f8a01f6c19b479ccbc'
	    'a95c18ad3ea7b312d1da14edc75de45a4d1f86374258711eea6bf7f9d007e758a95b7cee0d5e45bf99d1c2f29dfe29dff238e1c5a44723761cf2b554f888913e'
	    'SKIP'
	    'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ${srcdir}/glibc_stime.patch	
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make oldconfig || return 1
  make busybox || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make CONFIG_PREFIX=${pkgdir}/usr/lib/mindi/rootfs install
}

