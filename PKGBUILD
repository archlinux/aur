#!/bin/bash
# Maintainer: Ondrej Hruska <ondra@ondrovo.com>

_pkgname="autonumlock"
pkgname="autonumlock"

pkgver="1.2.2"
pkgrel=1

pkgdesc="Automatically enables Numlock for external keyboard. Can also execute custom commands, like 'xmodmap'."
arch=("any")
url="https://github.com/MightyPork/autonumlock"
license=("MIT")

depends=(bash usbutils numlockx)

source=("https://github.com/MightyPork/autonumlock/archive/$pkgver.zip")
provides=($_pkgname)
replaces=($_pkgname "autonumlock-git")

md5sums=('50e268b7a88dfd1e3dff6ace6c857c8f')

package() {
	# install license

	srcd="${srcdir}/${_pkgname}-${pkgver}/"

	install -Dm 644 $srcd"LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	mkdir "${pkgdir}/usr/share/${_pkgname}/"

	cp -p $srcd"autonumlock" "${pkgdir}/usr/share/${_pkgname}/"
	cp -p $srcd"default_config" "${pkgdir}/usr/share/${_pkgname}/"

	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/usr/share/${_pkgname}/autonumlock" "${pkgdir}/usr/bin/autonumlock"
}
