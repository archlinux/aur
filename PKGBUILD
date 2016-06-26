# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Thomas Scheiblhuber <thomas@scheiblhuber.de>
# Contributor: Joonas Henriksson
# Contributor: Rutger Broekhoff

pkgname=natron-bin
pkgver=2.0.5
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Video compositing software similar to Nuke and Adobe After Effects'
url='http://natron.fr/'
license=('GPL')
depends=('ffmpeg' 'p7zip')
optdepends=('blender: for 3d opencolor-io support')
conflicts=('natron' 'natron-rc' 'natron-bin-dev')
options=('!strip')
source=("natron.desktop" "x-natron.xml")
source_i686=("http://downloads.natron.fr/Linux/releases/32bit/files/Natron-${pkgver}-Linux-x86_32bit-portable.tar.xz")
source_x86_64=("http://downloads.natron.fr/Linux/releases/64bit/files/Natron-${pkgver}-Linux-x86_64bit-portable.tar.xz")

md5sums=('5c65b106c295abe0b5346eff18a06767'
         'ca5186feb5a7f336517c015f72d0f8c8')
md5sums_i686=('154966f2f9ffee18f90d5d11ce8f698e')
md5sums_x86_64=('5df8f464d54552644243e3602dba35e5')

package() {
	if [ "${CARCH}" = "x86_64" ]; then
		_source_arch="64"
	else
		_source_arch="32"
	fi

	install -d "${pkgdir}/usr/share"
	cp -R "${srcdir}/Natron-${pkgver}-Linux-x86_${_source_arch}bit" "${pkgdir}/usr/share/natron"

	install -d "${pkgdir}/usr/bin"
	ln -s "${pkgdir}/usr/share/natron/Natron" "${pkgdir}/usr/bin/natron"
    install -D "${pkgdir}/usr/share/natron/Resources/pixmaps/natronIcon256_linux.png" "${pkgdir}/usr/share/pixmaps/natronIcon256_linux.png"
    install -D "${pkgdir}/usr/share/natron/Resources/pixmaps/natronProjectIcon_linux.png" "${pkgdir}/usr/share/pixmaps/natronProjectIcon_linux.png"
    install -Dm644 "${srcdir}/natron.desktop" "${pkgdir}/usr/share/applications/natron.desktop"
    install -D "${srcdir}/x-natron.xml" "${pkgdir}/usr/share/mime/packages/x-natron.xml"
}
