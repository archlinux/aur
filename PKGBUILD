# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Luca Contini <jkd[dot]luca[at]gmail[dot]com>

pkgname=asbru-cm-gtk3-git
_pkgname=${pkgname%-gtk3-git}
pkgver=6.0.0
pkgrel=2
arch=('any')
license=('GPL3')
pkgdesc="A free and open-source connection manager. GTK3 depelopment branch. GIT version"
url="https://github.com/asbru-cm/asbru-cm"
depends=('perl' 'vte3' 'cairo-perl' 'glib-perl' 'pango-perl' 'perl-socket6' 'perl-expect' 'perl-yaml' 'perl-crypt-cbc' 'perl-crypt-blowfish' 'perl-gtk3' 'perl-net-arp' 'uuid' 'openssh' 'inetutils' 'perl-crypt-rijndael' 'perl-xml-parser' 'libcanberra' 'perl-gtk3-simplelist' 'libwnck3' 'perl-io-stty' 'perl-io-tty')
optdepends=('uucp: Unix-to-Unix Copy' 'rdesktop: RDP connections' 'freerdp: RDP connections' 'openssh: SSH connections' 'mosh: Mobile shell' 'tigervnc: for VNC connections'
	    'perl-x11-guitest: To fit perfectly RDP tabs')
makedepends=('git')
#conflicts=()
source=("git+https://github.com/asbru-cm/asbru-cm.git#branch=gtk3" asbru-cm-gtk3.desktop)
sha256sums=('SKIP'
            '2a79176347ca05ae465ee9c6e64b252d67dc3cfb6d1df92b1cfb9b0b731c2561')

package() {
	cd ${srcdir}/${_pkgname}
	mkdir -p $pkgdir/{opt/asbru-gtk3,usr/share/pixmaps,usr/share/man/man1,usr/share/applications,usr/bin,etc/bash_completion.d}
	cp -rp res utils lib $pkgdir/opt/asbru-gtk3/
	cp -p res/asbru_bash_completion $pkgdir/etc/bash_completion.d/asbru_gtk3_bash_completion
	cp res/asbru-logo-64.png $pkgdir/usr/share/pixmaps/${_pkgname}-gtk3.png
	cp ${srcdir}/asbru-cm-gtk3.desktop $pkgdir/usr/share/applications/
	gzip -c res/${_pkgname}.1 > $pkgdir/usr/share/man/man1/${_pkgname}-gtk3.1.gz
	cp -p ${_pkgname} $pkgdir/opt/asbru-gtk3/${_pkgname}
	chmod 755 $pkgdir/opt/asbru-gtk3/${_pkgname}
	ln -sf /opt/asbru-gtk3/${_pkgname} $pkgdir/usr/bin/${_pkgname}-gtk3
}


