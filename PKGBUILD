# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

_pkgname=pep-engine
pkgname=$_pkgname-hg
pkgver=2.1.9
pkgrel=1
pkgdesc="A Free Software library for automatic key management and encryption of messages."
arch=('x86_64' 'i686')
url='https://pep.software'
license=('GPL3')
makedepends=('mercurial' 'asn1c' 'make' 'yml2')
depends=('libetpan-fdik-git' 'gpgme' 'sqlite' 'sequoia')
provides=('pep-engine')
source=("hg+https://pep.foundation/dev/repos/pEpEngine")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/pEpEngine"

	hg up
	
	echo "PREFIX=$pkgdir/usr" > 'local.conf'
	echo "PER_MACHINE_DIRECTORY=$pkgdir/usr/share/pEp" >> 'local.conf'
	echo "YML2_PATH=/usr/bin" >> 'local.conf'
}

pkgver() {
	cd "$srcdir/pEpEngine"

	hg tags | grep Release | grep -v RC | sort -r | head -1 | awk '{print $1}' | cut -c9-
}

build() {
	cd "$srcdir/pEpEngine"
	
	make
	make db
}

package() {
	cd "$srcdir/pEpEngine"
	
	make install
	make dbinstall
}

