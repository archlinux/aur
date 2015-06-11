# Maintainer: unclesam <web _AT_ shinobi-mail _DOT_ de>
pkgname=mintstick-git
pkgver=1.2
pkgrel=4
epoch=
pkgdesc="Format or write images to usb-sticks (Linux Mint tool)"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/mintstick"
license=('GPL2')
depends=('python2' 'python2-gobject' 'udisks' 'python2-pyparted')
optdepends=()
makedepends=()
provides=()
conflicts=()
options=()
install=
source=(https://github.com/linuxmint/mintstick/archive/master.zip)
md5sums=(SKIP)

package() {
	LIBFILES="mintstick.py raw_write.py raw_format.py mountutils.py"
	DATAFILES="mintstick.ui"
	
	mv "$srcdir/mintstick-master" "$srcdir/$pkgname-$pkgver"
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p ${pkgdir}/usr/bin/
	mkdir -p ${pkgdir}/usr/share/applications/
	mkdir -p ${pkgdir}/usr/share/polkit-1/actions
	mkdir -p ${pkgdir}/usr/share/kde4/apps/solid/actions
	# need python2 to execute the script
	number=$(grep -n "$DIR/mintstick.py " mintstick |cut -f1 -d:);
	sed -i ${number}d mintstick
	echo 'python2 $DIR/mintstick.py "$@"' >> mintstick
	#
	cp share/applications/mintstick.desktop ${pkgdir}/usr/share/applications/
    cp share/applications/mintstick-format.desktop ${pkgdir}/usr/share/applications/
    cp share/applications/mintstick-kde.desktop ${pkgdir}/usr/share/applications/
    cp share/applications/mintstick-format-kde.desktop ${pkgdir}/usr/share/applications/
    cp share/polkit/org.linuxmint.im.policy ${pkgdir}/usr/share/polkit-1/actions
    cp share/kde4/mintstick-format_action.desktop ${pkgdir}/usr/share/kde4/apps/solid/actions
    cp mintstick ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/usr/lib/mintstick
    mkdir -p ${pkgdir}/usr/share/mintstick

    for item in $LIBFILES; do
        cp lib/$item ${pkgdir}/usr/lib/mintstick/
    done

    for item in $DATAFILES; do
        cp share/mintstick/$item ${pkgdir}/usr/share/mintstick/
    done
}
