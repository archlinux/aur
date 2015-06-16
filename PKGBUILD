## Contributor: quantax -- contact via Arch Linux forum or AUR
## Contributor: Michal Krenek <mikos@sg1.cz>
## Contributor: redden0t8 -- contact via Arch Linux forums or AUR

pkgname=pam_abl
pkgver=0.6.0
pkgrel=1
pkgdesc="Automated blacklisting on repeated failed authentication attempts"
arch=('i686' 'x86_64')
url="http://pam-abl.sourceforge.net/"
license=('GPL')
depends=(db pam)
makedepends=(asciidoc cmake)
source=(http://downloads.sourceforge.net/pam-abl/pam-abl-$pkgver.tar.gz)
md5sums=('62e02b88cf2da09eeea101a99f69f1ee')
install="pam_abl.install"

build() {
	cd "$srcdir"
	
	# configure
	cmake . -DCMAKE_INSTALL_PREFIX=/usr

	# build binaries
	make || return 1

	# generate documentation
	cd doc
	sh generate.sh
	cd ..
}

package() {
	# install binaries
	make install DESTDIR="$pkgdir/"

	# install example configuration
	install --mode=0644 -D -- conf/pam_abl.conf \
					"$pkgdir/etc/security/pam_abl.conf.example"

	#install documentation
	install --mode=0644 -D -- doc/pam_abl.1 \
		            "$pkgdir/usr/share/man/man1/pam_abl.1"
	install --mode=0644 -D -- doc/pam_abl.8 \
		            "$pkgdir/usr/share/man/man8/pam_abl.8"
	install --mode=0644 -D -- doc/pam_abl.conf.5 \
		            "$pkgdir/usr/share/man/man5/pam_abl.conf.5"
}


