# Maintainer: tioguda <tioguda@gmail.com>
# Contributor: Rafael Fontenlle <rafaelff@gnome.org>

pkgname=warsaw-bin
pkgver=1.12.10.8
pkgrel=4
pkgdesc="Banking security tool developed by GAS Tecnologia"
arch=(i686 x86_64)
url="http://www.dieboldnixdorf.com.br/warsaw"
license=('custom')
depends=('procps-ng' 'python2' 'python2-mini-amf' 'python2-unicodecsv' 'python-gpgme' 'python-pyopenssl' 'openssl' 'nss' 'zenity' 'gdk-pixbuf2' 'pango' 'glib2' 'libx11' 'libstdc++296')
makedepends=('chrpath')
conflicts=('warsaw')
provides=('warsaw')
options=(!strip)
source_i686=(https://cloud.gastecnologia.com.br/gas/diagnostico/warsaw_setup_32.deb)
source_x86_64=(https://cloud.gastecnologia.com.br/gas/diagnostico/warsaw_setup_64.deb)
sha256sums_i686=('79a4323531e1508def5ea8435c756aa75e7c14a1762dbcf403e5769fac6392d0')
sha256sums_x86_64=('b3c2449e9850c539c778f370a2ce91836e1f3871e5391ac5ccf87d31b0d57eaf')

prepare() {
	tar -xJf data.tar.xz
}

package() {
	cd "$srcdir"
	# dump etc files to /etc
	cp -r etc "$pkgdir"
	# dump usr files to /usr
	cp -r usr "$pkgdir"
	# dump lib files to /lib
	cp -r lib "$pkgdir/usr/"
    
	# Enable executable permission for binaries
	chmod +x "$pkgdir/usr/local/bin/warsaw/core"
	chmod +x "$pkgdir/usr/local/bin/warsaw/migratecache"
	chmod +x "$pkgdir/usr/local/bin/warsaw/wsatspi"

	# Set paths in comply with Arch Packaging Standards
	# i.e. Use /usr/bin, /etc, and /tmp
	sed -i 's|/usr/local/bin|/usr/bin|' \
	  "$pkgdir/etc/xdg/autostart/warsaw.desktop"
  
	# Install copyright and license in proper directory
	install -Dm644 "$pkgdir"/usr/share/{doc,licenses}/warsaw/copyright
	rm -rf "$pkgdir/usr/share/doc"
}
