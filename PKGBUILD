
# Maintainer: Anish Bhatt <anish [at] gatech [dot] edu>
pkgname=wine-browser-installer
pkgver=1
pkgrel=1
epoch=
pkgdesc="Browser installer for wine-silverlight, shared between netflix-desktop and pipelight"
arch=('any')
url="https://launchpad.net/netflix-desktop"
license=('LGPL2.1' 'MIT')
depends=('wine-silverlight' 'ttf-ms-fonts' 'wget')

optdepends=()
#install=
#changelog=
source=(http://bazaar.launchpad.net/~ehoover/netflix-desktop/trunk/download/head:/hwacceldefault-20130827205229-rdlz1uxnkgfds0az-1/hw-accel-default
        http://bazaar.launchpad.net/~ehoover/netflix-desktop/trunk/download/head:/hwacceldefault-20130827205229-rdlz1uxnkgfds0az-1/gizmos
	http://bazaar.launchpad.net/~ehoover/netflix-desktop/trunk/download/head:/copyright-20121127215043-6ku8w1ub5rzvwo3m-1/copyright)
noextract=()
md5sums=(SKIP
	SKIP
	SKIP)

prepare() {
	cd "$srcdir"
	sed -i 's|wine-browser-installer|wine-silverlight|g' hw-accel-default
	sed -i 's|wine-browser-installer|wine-silverlight|g' gizmos
}

package() {
	cd "$srcdir"
	install -dm644 ${pkgdir}/usr/share/wine-silverlight

	install -Dm755 gizmos "${pkgdir}"/usr/share/wine-silverlight/.
	install -Dm755 hw-accel-default "${pkgdir}"/usr/share/wine-silverlight/.

        # Install MIT license
        install -Dm644 "copyright" "${pkgdir}/usr/share/licenses/${pkgname}/Copyright.txt"

}
