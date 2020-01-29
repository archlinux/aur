# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Luca Contini <jkd[dot]luca[at]gmail[dot]com>

pkgname=asbru-cm-loki-git
_pkgname=${pkgname%-loki-git}
pkgver=6.1.0
pkgrel=1
arch=('any')
license=('GPL3')
pkgdesc="A free and open-source connection manager. loki depelopment branch. GIT version"
url="https://github.com/asbru-cm/asbru-cm"
depends=('perl' 'vte3' 'cairo-perl' 'glib-perl' 'pango-perl' 'perl-socket6' 'perl-expect' 'perl-yaml' 'perl-crypt-cbc' 'perl-crypt-blowfish' 'perl-gtk3' 'perl-net-arp' 'uuid' 'openssh' 'inetutils' 'perl-crypt-rijndael' 'perl-xml-parser' 'libcanberra' 'perl-gtk3-simplelist' 'libwnck3' 'perl-io-stty' 'perl-io-tty')
optdepends=('uucp: Unix-to-Unix Copy' 'rdesktop: RDP connections' 'freerdp: RDP connections' 'openssh: SSH connections' 'mosh: Mobile shell' 'tigervnc: for VNC connections'
	    'perl-x11-guitest: To fit perfectly RDP tabs')
makedepends=('git')
#conflicts=()
source=("git+https://github.com/asbru-cm/asbru-cm.git#branch=loki" asbru-cm-loki.desktop)
sha256sums=('SKIP'
            '6c22432e241f0743f8ac294b7623cbce5a41b0a8c859677853450e5451dc3d99')

package() {
	cd ${srcdir}/${_pkgname}
	mkdir -p $pkgdir/{opt/asbru-loki,usr/share/pixmaps,usr/share/man/man1,usr/share/applications,usr/bin,etc/bash_completion.d}
	cp -rp res utils lib $pkgdir/opt/asbru-loki/
	cp -p res/asbru_bash_completion $pkgdir/etc/bash_completion.d/asbru_loki_bash_completion
	cp res/asbru-logo-64.png $pkgdir/usr/share/pixmaps/${_pkgname}-loki.png
	cp ${srcdir}/asbru-cm-loki.desktop $pkgdir/usr/share/applications/
	gzip -c res/${_pkgname}.1 > $pkgdir/usr/share/man/man1/${_pkgname}-loki.1.gz
	cp -p ${_pkgname} $pkgdir/opt/asbru-loki/${_pkgname}
	chmod 755 $pkgdir/opt/asbru-loki/${_pkgname}
	ln -sf /opt/asbru-loki/${_pkgname} $pkgdir/usr/bin/${_pkgname}-loki
}


