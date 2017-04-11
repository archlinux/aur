# Maintainer: Declan Hoare <declanhoare at exemail dot com dot au>
pkgname=mymencoder
pkgver=0.3.1
pkgrel=1
pkgdesc="Frontend for mencoder"
arch=('any')
url="http://kellerleiche.bplaced.net/"
license=('GPL2')
depends=('gtkdialog' 'xterm' 'mplayer' 'mencoder' 'mediainfo' 'yad' 'dvdbackup')
optdepends=('gedit: editor detected by the program'
			'kwrite: editor detected by the program'
			'mousepad: editor detected by the program'
			'leafpad: editor detected by the program')
source=("MyMencoder-0.3.1-1pclos2012.src.rpm::http://ftp.nluug.nl/pub/os/Linux/distr/pclinuxos/pclinuxos/srpms/SRPMS.pclos/MyMencoder-0.3.1-1pclos2012.src.rpm")
md5sums=('c5daab767fd917be68b1dc9c7fe83c60')
sha1sums=('c738207de0441685fbcce82cb0b705f76dde6ea5')
sha224sums=('2c72d759b2834e7cf14e4307bae65eb1961610c6e3b6755585d9fb99')
sha256sums=('ee84dfb7c413a527987512116051a432f7ecbc2d19d499c495da1bf9db074210')

prepare() {
	bsdtar xvf MyMencoder-${pkgver}.tar.xz
}

package() {
	cd MyMencoder-${pkgver}
	# Replace RPM macros and run included install script
	sed -n \
	"$(( $(grep -n %install ../pclos-MyMencoder.spec | awk '{print $1}' FS=":") + 2)), \
	$(( $(grep -n %post ../pclos-MyMencoder.spec | head -n1 | awk '{print $1}' FS=":") - 1)) p" \
	../pclos-MyMencoder.spec | sed -e "s|%{buildroot}|\"${pkgdir}\"|g" -e "s|%{_bindir}|/usr/bin|g" \
	-e "s|%{_datadir}|/usr/share|g" -e "s|%{_iconsdir}|/usr/share/icons|g" \
	-e "s|\$RPM_BUILD_DIR|..|g" -e "s|%{name}|MyMencoder|g" \
	-e "s|%{version}|${pkgver}|g" | source /dev/stdin
}
