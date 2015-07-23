pkgname=pam_u2f-git
pkgver=1.0.1.r11.gc383c0e
pkgrel=1
pkgdesc="Universal 2nd Factor (U2F) PAM authentication module from Yubico - git checkout"
arch=('i686' 'x86_64')
url='https://developers.yubico.com/pam-u2f/'
license=('BSD')
depends=('pam' 'libu2f-host' 'libu2f-server')
makedepends=('git' 'autoconf' 'automake' 'asciidoc' 'libxslt' 'libxml2' 'docbook-xml' 'docbook-xsl')
provides=('pam_u2f')
conflicts=('pam_u2f')
source=("git://github.com/Yubico/pam-u2f.git")
md5sums=('SKIP')

pkgver() {
	cd pam-u2f/
	git describe --long --tags | sed 's/^pam_u2f.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd pam-u2f/
	autoreconf -fi
	./configure --prefix=/ --with-pam-dir=/lib/security/
	make
}

check() {
	cd pam-u2f/
	make check
}

package() {
	cd pam-u2f/
	make DESTDIR="${pkgdir}/usr" install
}
