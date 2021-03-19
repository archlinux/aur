# Contributor: Francesco Colista <fcolista@alpinelinux.org>
# Maintainer: Francesco Colista <fcolista@alpinelinux.org>

pkgname=cvechecker
pkgver=4.0
pkgrel=1
pkgdesc="a local CVE checker tool"
arch=('i686' 'x86_64')
url="https://github.com/sjvermeu/cvechecker"
license=('GPL')
groups=('system')
depends=('libconfig>=1.3' 'sqlite3' 'wget' 'libxslt' 'jq' 'libbsd')
makedepends=('autoconf')
provides=('cvechecker')
conflicts=('cvechecker-svn')
replaces=()
backup=()
options=()
install='cvechecker.install'
noextract=()
source=("https://github.com/sjvermeu/${pkgname}/archive/${pkgname}-${pkgver}.zip")
md5sums=('b6083a2ad9a23f7d7ef509353ed8dfff')

build() {
	cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}
	aclocal && \
	autoheader && \
	automake -ac && \
	autoreconf --install
	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--enable-sqlite3
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}
	make install DESTDIR=${pkgdir}
}

