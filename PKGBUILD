# Maintainer: Joe666 <joe666@gnovus.com>

pkgname="brother-mfc-j280w"
pkgver="1.1.3"
pkgrel=1
_revision=1
pkgdesc="LPR and CUPS driver for the Brother MFC-J280W. This package is based off the MFC-J265W, all credit is for woegjiub"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('unknown')
install='brother-mfc-j280w.install'
depends=('tcsh' 'deb2targz' 'perl' 'a2ps')
source=(
	"http://download.brother.com/welcome/dlf006550/mfcj280wlpr-3.0.1-1.i386.deb"
	"http://download.brother.com/welcome/dlf006552/mfcj280wcupswrapper-3.0.0-1.i386.deb"
)
md5sums=('a4c91309efbb22755c0aad4992d6de0c'
         '45ac64d2d7dd84f060f7239b79f7e875')

package() {
	deb2targz *.deb >/dev/null || return 1
	rm -f *.deb || return 1
	cd $srcdir || return 1
	[ -d "mfcj280w" ] || (mkdir mfcj280w || return 1)
	for i in *.tar.gz;do tar xfz $i -C mfcj280w;done || return 1
	cd mfcj280w || return 1
	cd opt/brother/Printers/mfcj280w || return 1
	perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfcj280w || return 1
	perl -i -pe 's#printcap\.local#printcap#g' ./inf/setupPrintcapij || return 1
	cp -rf $srcdir/mfcj280w/usr/ $pkgdir/ || return 1
	cp -rf $srcdir/mfcj280w/opt/ $pkgdir/ || return 1
}
