# Maintainer: bemxio <bemxiov at protonmail dot com>
# Contributor: Ulysses Ribeiro <ulyssesrr at gmail dot com>

_pkgname="steam-rom-manager"
pkgname="${_pkgname}-bin"

pkgdesc="An app for managing ROMs in Steam (extracted from Debian package)"

pkgver=2.5.43
pkgrel=1

arch=(x86_64)

url="https://github.com/SteamGridDB/${_pkgname}"
license=(GPL-3.0-or-later)

depends=(gtk3 libnotify libxss libxtst xdg-utils at-spi2-core util-linux-libs libsecret)

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}-git" "${_pkgname}-appimage")

source=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
md5sums=(2f07224e6ed23fad69e3a45c111b893e)

options=(!strip)

package() {
	# extract files from Debian package
	bsdtar -xf data.tar.xz -C "${pkgdir}"

	# create directory for symlink
	mkdir -p "${pkgdir}/usr/bin"

	# create symbolic link to executable
	ln -s "/opt/Steam ROM Manager/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
