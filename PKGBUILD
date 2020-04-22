# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

_pkgname=pep-engine
pkgname=$_pkgname-hg
pkgver=r4205.f75e9274551f
pkgrel=1
pkgdesc="A Free Software library for automatic key management and encryption of messages."
arch=('x86_64' 'i686')
url='https://pep.software'
license=('GPL3')
makedepends=('mercurial' 'asn1c' 'make' 'yml2')
depends=('libetpan-fdik-git' 'gpgme' 'sqlite')
provides=('pep-engine')
source=("hg+https://pep.foundation/dev/repos/pEpEngine")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/pEpEngine"

	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	cd "$srcdir/pEpEngine"
	
	echo "PREFIX=$pkgdir/usr" > 'local.conf'
	echo "PER_MACHINE_DIRECTORY=$pkgdir/usr/share/pEp" >> 'local.conf'
	echo "YML2_PATH=/usr/bin" >> 'local.conf'

	make all
	make db
}

package() {
	cd "$srcdir/pEpEngine"
	
	make install
}

