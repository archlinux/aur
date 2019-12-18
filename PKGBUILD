# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=cvechecker-git
pkgver=v3.9.r13.g1e751b9
pkgrel=2
pkgdesc="a local CVE checker tool"
arch=('i686' 'x86_64')
url="https://github.com/sjvermeu/cvechecker"
license=('GPL')
groups=('system')
depends=('libconfig>=1.3' 'sqlite3' 'wget' 'libxslt')
makedepends=('autoconf' 'make' 'gcc')
provides=('cvechecker')
conflicts=('cvechecker')
replaces=()
backup=()
options=()
install='cvechecker.install'
noextract=()
source=("${pkgname}::git+https://github.com/sjvermeu/cvechecker.git")
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${pkgname}

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"

	autoreconf -ivf
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--enable-sqlite3
	make
}

package() {
	cd "${srcdir}/${pkgname}"

	make DESTDIR="${pkgdir}" install
}
