# Maintainer: Patrik Plihal <patrik.plihal at gmail dot com>

pkgname=ckan
pkgver=1.25.1
pkgrel=1
pkgdesc='All you need to find, install, and manage mods for Kerbal Space Program (ksp)'
arch=('any')
url="https://github.com/KSP-CKAN/CKAN/"
license=('MIT')
depends=('mono')
conflicts=('ckan-git')

# Debian package is smaller than .exe and contains man page/icons/mono wrapper
source=("${pkgname}-${pkgver}.deb::https://github.com/KSP-CKAN/CKAN/releases/download/v${pkgver}/${pkgname}_${pkgver}_all.deb")
sha256sums=('f77fa3d6dff3dcee897072e3f507aed2b56da396da84e5f537da6ae3e9603054')

prepare() {
	cd ${srcdir}
	ar xv ../${pkgname}-${pkgver}.deb
	tar xfv data.tar.xz
	rm control.tar.gz data.tar.xz debian-binary
}

install_helper()
{
	mode="$1"
	path="$2"

	# parent dir
	install -d -m 755 "${pkgdir}/$(dirname $path)"
	install -D -m "${mode}" "${path}" "${pkgdir}/${path}"
}
package() {
	cd ${srcdir}
	install_helper 755 usr/bin/ckan
	install_helper 644 usr/lib/ckan/ckan.exe
	install_helper 644 usr/share/applications/ckan.desktop
	install_helper 644 usr/share/icons/ckan.ico
	install_helper 644 usr/share/doc/ckan/changelog.gz
	install_helper 644 usr/share/doc/ckan/copyright
	install_helper 644 usr/share/man/man1/ckan.1.gz
	# changelog.Debian.gz is useless, no need to install
}

