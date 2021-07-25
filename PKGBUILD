# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

_pkgname=pep-engine
pkgname=$_pkgname-git
pkgver=3.1.8
pkgrel=1
pkgdesc="A Free Software library for automatic key management and encryption of messages."
arch=('x86_64' 'i686')
url='https://pep.software'
license=('GPL3')
makedepends=('git' 'asn1c' 'make' 'yml2')
depends=('gpgme' 'sqlite' 'sequoia')
provides=('pep-engine')
source=("git+https://gitea.pep.foundation/pEp.foundation/pEpEngine.git")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/pEpEngine"

	echo "PREFIX=$pkgdir/usr" > 'local.conf'
	echo "PER_MACHINE_DIRECTORY=$pkgdir/usr/share/pEp" >> 'local.conf'
	echo "YML2_PATH=/usr/bin" >> 'local.conf'
}

pkgver() {
	cd "$srcdir/pEpEngine"

	git tag | grep "^Release" | grep -v RC | sort -V -r | head -1 | tr '_-' ' ' | awk '{print $2}'
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

