# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=rcr
pkgver=1.4.2.1201
pkgrel=1
pkgdesc="Red Crucible®: Reloaded - Free to play online FPS"
arch=('i686' 'x86_64')
url="http://www.rocketeergames.com/site/rcr/"
license=('LLC')
# depends=()
# makedepends=()
source=("http://cdn.rocketeergames.com/rcreloaded/redcrucible_lin.zip" "rcr.desktop")
md5sums=('0b69b7d01b069c9a02cc445e4ee4ad87' 'b03e6aadb89d013092b10666bfbb9460')

package() {

	msg2 "Removing different architectures files..."
	if [ "$CARCH" = "x86_64" ]; then
		rm -f  "${srcdir}/Red Crucible Reloaded.x86"
		rm -rf "${srcdir}/Red Crucible Reloaded_Data/Plugins/x86"
		rm -rf "${srcdir}/Red Crucible Reloaded_Data/Mono/x86"
	else
		rm -f  "${srcdir}/Red Crucible Reloaded.x86_64"
		rm -rf "${srcdir}/Red Crucible Reloaded_Data/Plugins/x86_64"
		rm -rf "${srcdir}/Red Crucible Reloaded_Data/Mono/x86_64"
	fi

	# Define my architecture (32bit named as "x86" and not "i686"):
	if [ "$CARCH" = "x86_64" ] ; then MYARCH="x86_64" ; else MYARCH="x86" ; fi

    msg2 "Installing files..."

    # System files:
    install -D -m644 "${srcdir}/rcr.desktop" "${pkgdir}/usr/share/applications/rcr.desktop"
    install -D -m644 "${srcdir}/Red Crucible Reloaded_Data/Resources/UnityPlayer.png" "${pkgdir}/usr/share/pixmaps/rcr.png"

    # Application files:
	install -D "${srcdir}/Red Crucible Reloaded.${MYARCH}" "${pkgdir}/opt/rcr/Red Crucible Reloaded.${MYARCH}"
	cp -r "${srcdir}/Red Crucible Reloaded_Data" "${pkgdir}/opt/rcr/"
	chmod -R 755 "${pkgdir}/opt/rcr"

	# Make it launchable from CLI ("ln -s" doesn't work in our case):
	echo "\"/opt/rcr/./Red Crucible Reloaded.${MYARCH}\"" > "${srcdir}/rcr_launcher"
    install -D -m755 "${srcdir}/rcr_launcher" "${pkgdir}/usr/bin/rcr"
}