# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Past maintainer: F. Miñano <cicely@algofacil.info>
pkgname=mindi-busybox
pkgver=1.21.1
pkgrel=2
pkgdesc="This package provides a busybox version suited for Mindi"
arch=('i686' 'x86_64')
url="http://www.mondorescue.org/"
license=('GPL')
depends=(gcc)

#There are two official mirrors. If one is not working try the other. The muskokamug.org seems faster.
source=("ftp://ftp.mondorescue.org/src/${pkgname}-${pkgver}.tar.gz"
	"dhcpc.patch"
	"${pkgname}-${pkgver}.tar.gz.sig"
	"dhcpc.patch.sig")
sha512sums=('6205e16585604c7b3c55a9b5677dc42e60bf4d63d08b2c4feb6511cf1ec11a70820732c89706ad99dbd4d506a2146581a7fd7f33426a9d41ecdc6dfef1ded10f'
	    'ba1d110e4207481d02f05cc5e79b927270439c97d1ec1455e5a173c903fed7fd91cc0953279873da61fe4a7b4b8a51e29ab48d2d531be3d2b861d92586728b3d'
            'SKIP'
	    'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ${srcdir}/dhcpc.patch
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

