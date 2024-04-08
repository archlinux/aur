# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Christian Pellegrin (chripell) <chripell@fsfe.org>
# Contributor: An Nguyen (stk) <an@linux.com>
# Contributor: George Angelopoulos <george@usermod.net>
# Contributor: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor: dront78 <dront78@gmail.com>

pkgname=systemtap
pkgver=5.0
pkgrel=1
pkgdesc="Infrastructure to simplify the gathering of information about the running Linux system"
url="https://sourceware.org/systemtap/"
arch=('x86_64')
license=('GPL')
depends=('elfutils' 'nss' 'python' 'cpio')
makedepends=('python-setuptools' 'xmlto')
optdepends=('sqlite3: for storing results in a database')
options=('!emptydirs')
install="${pkgname}.install"
source=("https://sourceware.org/ftp/${pkgname}/releases/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha512sums=('dc511a05e66abcbbd8c926973962751196180f3c571d0cd2a3b158ae367c5339ad32967a680ecd03224ab5f7ed2c55be7064867e4fb1b1cd7ea1cb21b2436e4c'
            'SKIP')

validpgpkeys=('41A0C11274B1E87FE28E4C53E3D77E1F95161991')

build() {
	cd "${pkgname}-${pkgver}"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib/"${pkgname}" \
		--libdir=/usr/lib/"${pkgname}" \
		--mandir=/usr/share/man/ \
		--sbindir=/usr/bin \
		--localstatedir=/var \
		--enable-pie \
		--disable-docs \
		--enable-htmldocs \
		--with-python3
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
