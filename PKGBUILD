_pkgname=gaiasky
pkgname=gaiasky-git
pkgver=3.5.0.rc10.5.ga7af6c2ba
pkgrel=1
pkgdesc="Open source 3D universe simulator for desktop and VR with support for more than a billion objects. Git version"
arch=('x86_64')
url="https://gitlab.com/gaiasky/gaiasky"
license=('MPL')
depends=('java-runtime')
conflicts=('gaiasky')
makedepends=('git' 'java-environment-common' 'help2man')
source=("git+https://gitlab.com/gaiasky/gaiasky")
sha256sums=('SKIP')


pkgver() {
	cd ${_pkgname}
	git describe --always | sed 's/-/./g'
}

build() {
	cd ${_pkgname}
	./gradlew core:dist
}

package(){
	cd ${_pkgname}

	mkdir -p "$pkgdir/opt/${_pkgname}"
        mkdir -p "$pkgdir/usr/bin"
        mkdir -p "$pkgdir/usr/share/applications"

	_pkgver=$(find ${srcdir}/gaiasky/releases/ -iname "gaiasky-*" -type d)
	install -m755 "${srcdir}/${_pkgname}/core/exe/gaiasky" "$pkgdir"/usr/bin/gaiasky
        install -m755 "${srcdir}/${_pkgname}/core/exe/gaiasky.desktop" "$pkgdir"/usr/share/applications
	cd "${_pkgver}"
	mv * "${pkgdir}/opt/${_pkgname}"
}
