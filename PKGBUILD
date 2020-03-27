# Maintainer: Emilien Devos <contact.at.emiliendevos.dot.be>
# Forked from PKGBUILD from Joan Figueras

pkgname=asbru-cm
_pkgname=${pkgname}
pkgver=6.1.1
pkgrel=1
arch=('any')
license=('GPL3')
pkgdesc="A free and open-source connection manager. Latest release pulled from GIT."
url="https://github.com/asbru-cm/asbru-cm"
depends=('perl' 'vte3' 'cairo-perl' 'glib-perl' 'pango-perl' 'perl-socket6' 'perl-expect' 'perl-yaml' 'perl-crypt-cbc' 'perl-crypt-blowfish' 'perl-gtk3' 'perl-net-arp' 'uuid' 'openssh' 'inetutils' 'perl-crypt-rijndael' 'perl-xml-parser' 'libcanberra' 'perl-gtk3-simplelist' 'libwnck3' 'perl-io-stty' 'perl-io-tty')
optdepends=('uucp: Unix-to-Unix Copy' 'rdesktop: RDP connections' 'freerdp: RDP connections' 'openssh: SSH connections' 'mosh: Mobile shell' 'tigervnc: for VNC connections'
	    'perl-x11-guitest: To fit perfectly RDP tabs')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("git+https://github.com/asbru-cm/asbru-cm.git#tag=${pkgver}")
sha256sums=('SKIP')

package() {
	cd ${srcdir}/${_pkgname}
	mkdir -p $pkgdir/{opt/asbru,usr/share/pixmaps,usr/share/man/man1,usr/share/applications,usr/bin,etc/bash_completion.d}
	cp -rp res utils lib $pkgdir/opt/asbru/
	cp -p res/asbru_bash_completion $pkgdir/etc/bash_completion.d/asbru_bash_completion
	cp res/asbru-logo-64.png $pkgdir/usr/share/pixmaps/${_pkgname}.png
	cp res/${_pkgname}.desktop $pkgdir/usr/share/applications/
	gzip -c res/${_pkgname}.1 > $pkgdir/usr/share/man/man1/${_pkgname}.1.gz
	cp -p ${_pkgname} $pkgdir/opt/asbru/${_pkgname}
	chmod 755 $pkgdir/opt/asbru/${_pkgname}
	ln -sf /opt/asbru/${_pkgname} $pkgdir/usr/bin/${_pkgname}
}


