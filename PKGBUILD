# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=serval-dna-git
_pkgname=serval-dna
pkgver=ffeb25aa
pkgrel=1
pkgdesc=""
arch=('any')
url=""
license=('')
groups=()
depends=('glibc')
makedepends=('automake' 'autoconf')
optdep=('java-environment' 'swift')
provides=('serval-dna')
conflicts=('serval-dna')
replaces=('serval-dna')
options=(!emptydirs)
source=("git+https://github.com/servalproject/${_pkgname}.git")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$_pkgname"
	autoreconf -f -i -I m4
	env SERVAL_RUN_PATH=/var/run/serval SYSTEM_LOG_PATH=/var/log SERVAL_LOG_PATH=/var/log/serval ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
}

build() {
	cd "$srcdir/$_pkgname"
	make
}


package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="${pkgdir}" install
}

pkgver() {
	cd "$srcdir/$_pkgname"
	git rev-parse --short HEAD
}
