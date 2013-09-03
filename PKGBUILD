
# Maintainer: Anish Bhatt <anish [at] gatech [dot] edu>
pkgname=wine-browser-installer
pkgver=1
pkgrel=3
epoch=
pkgdesc="Browser installer for wine-silverlight, shared between netflix-desktop and pipelight"
arch=('any')
url="https://launchpad.net/netflix-desktop"
license=('LGPL2.1' 'MIT')
depends=('ttf-ms-fonts' 'wget')

_pkname=netflix-desktop
optdepends=()
#install=
#changelog=
source=(https://launchpad.net/${_pkname}/trunk/0.8.4/+download/${_pkname}.tar.gz)
#noextract=()
md5sums=('2c7812e368ea681fb22a1f904c1bc6fc')

prepare() {
	pushd "${srcdir}/${_pkname}/${pkgname}"
	sed -i 's|wine-browser-installer|wine-silverlight|g' hw-accel-default
	sed -i 's|wine-browser-installer|wine-silverlight|g' gizmos
	sed -i "5 a\# Use [ -t 0 ] only when running manually from command line" hw-accel-default
	sed -i '8s|^|#|g' hw-accel-default
	sed -i '10,12s|^|#|g' hw-accel-default
	popd
}

package() {
	pushd ${srcdir}/${_pkname}
	pushd ${pkgname}
	install -dm755 ${pkgdir}/usr/share/wine-silverlight

	install -Dm755 gizmos "${pkgdir}"/usr/share/wine-silverlight/.
	install -Dm755 hw-accel-default "${pkgdir}"/usr/share/wine-silverlight/.
	popd
        # Install MIT license
        install -Dm644 "debian/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/Copyright.txt"
	popd
}
