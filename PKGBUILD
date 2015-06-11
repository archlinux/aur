# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=cerberus-logging
pkgver=1428445270
pkgrel=1
pkgdesc="Log-in logging extension for cerberus"
url="https://github.com/GNU-Pony/cerberus-logging"
arch=(i686 x86_64)
license=(GPL3)
depends=(glibc coreutils sh)
optdepends=('audit: for logging with audit')
makedepends=(make coreutils gcc glibc audit texinfo)
install=cerberus-logging.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(fedb5423eef21f108f1a293c17e625a3e49be9b891737b65b1284b6817ef59f1)

build() {
	cd "${srcdir}/cerberus-logging-${pkgver}"
	
	LDFLAGS= make PKGNAME="${pkgname}" info btmp utmp lastlog syslog audit
}

package() {
	cd "${srcdir}/cerberus-logging-${pkgver}"
	
	make PKGNAME="${pkgname}" DESTDIR="${pkgdir}" install-base install-info \
	     install-btmp install-utmp install-lastlog install-syslog install-audit
	
	_dir="${pkgdir}/usr/share/licenses/${pkgname}"
	ln -sf -- "/usr/share/licenses/common/GPL3" "${_dir}/LICENSE"
}

