# Contributor: Francesco Colista <fcolista@alpinelinux.org>
# Maintainer: Francesco Colista <fcolista@alpinelinux.org>

pkgname=cvechecker
pkgver=3.9
pkgrel=0
pkgdesc="a local CVE checker tool"
arch=('i686' 'x86_64')
url="https://github.com/sjvermeu/cvechecker"
license=('GPL')
groups=('system')
depends=('libconfig>=1.3' 'sqlite3' 'wget' 'libxslt')
makedepends=('autoconf')
provides=('cvechecker')
conflicts=('cvechecker-svn')
replaces=()
backup=()
options=()
install='cvechecker.install'
noextract=()
source=("https://github.com/sjvermeu/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('31f1691bd73c872f6e43f5867eeda29f')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
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
	cd ${srcdir}/${pkgname}-${pkgver}
	make install DESTDIR=${pkgdir}
}

