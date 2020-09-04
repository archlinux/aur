# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc=''
pkgbase=xcursor-cz-viator
pkgname=(xcursor-cz-viator-{hourglass,ring,rotor,windmill}-{white,black})
pkgver=20200713
pkgrel=2
_commit=fb8f37fa75fbae9df22a8976432214a46b77ce1e
license=(GPL3)
url=https://github.com/charakterziffer/cursor-toolbox
arch=(any)
makedepends=(git inkscape xorg-xcursorgen python2 patch)
depends=()
source=("${pkgbase}-${pkgver}::git+${url}#commit=${_commit}" build.patch)
sha512sums=('SKIP'
            'f49a595211dd9207dfae371b2b24b55a3500c26e5e5c63c7f1f6efc286333bfd14bd4b6e03dfeb526af4584bdce5d574402fdd8c3ab50019256fa980761961b3')

prepare () {
	cd "${pkgbase}-${pkgver}"
	patch -p1 < "${srcdir}/build.patch"
}

build () {
	cd "${pkgbase}-${pkgver}"
	local spinner color suffix

	for color in white black ; do
		if [[ ${color} = white ]] ; then
			suffix=''
		else
			suffix='-black'
		fi

		msg2 "Rendering color: ${color}"
		python2 render-pngs.py "svgs/template${suffix}.svg"

		for spinner in hourglass ring rotor windmill ; do
			msg2 "Rendering variant: ${spinner} ${color}"
			python2 render-pngs.py "svgs/spinner-${spinner}${suffix}.svg"

			themetitle="cz-Viator-${spinner}-${color}" ./make.sh
		done
	done
}

_package () {
	install -dm755 "${pkgdir}/usr/share/icons"
	cp -a "${pkgbase}-${pkgver}/cz-Viator-$1-$2" "${pkgdir}/usr/share/icons/"
}

package_xcursor-cz-viator-hourglass-white () {
	_package hourglass white
}

package_xcursor-cz-viator-hourglass-black () {
	_package hourglass black
}

package_xcursor-cz-viator-ring-white () {
	_package ring white
}

package_xcursor-cz-viator-ring-black () {
	_package ring black
}

package_xcursor-cz-viator-rotor-white () {
	_package rotor white
}

package_xcursor-cz-viator-rotor-black () {
	_package rotor black
}

package_xcursor-cz-viator-windmill-white () {
	_package windmill white
}

package_xcursor-cz-viator-windmill-black () {
	_package windmill black
}
