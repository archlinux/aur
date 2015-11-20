# Maintainer: Christian Hesse <mai@eworm.de>
# Contributor: Yakir Sitbon <kingyes1 at gmail dot com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Stas S <whats_up at tut dot by>
# Contributor: Hilinus <itahilinus at hotmail dot it>

pkgname=teamviewer-beta
pkgver=11.0.51386
pkgrel=2
pkgdesc='All-In-One Software for Remote Support and Online Meetings - beta version'
arch=('i686' 'x86_64')
url='http://www.teamviewer.com'
license=('custom')
options=('!strip')
provides=('teamviewer')
conflicts=('teamviewer')
depends_x86_64=('lib32-gcc-libs'
	'lib32-alsa-lib'
	'lib32-freetype2'
	'lib32-libice'
	'lib32-libpng12'
	'lib32-libsm'
	'lib32-libxdamage'
	'lib32-libxinerama'
	'lib32-libxrandr'
	'lib32-libxtst'
	'lib32-zlib')
depends_i686=('gcc-libs'
	'alsa-lib'
	'freetype2'
	'libice'
	'libpng12'
	'libsm'
	'libxdamage'
	'libxinerama'
	'libxrandr'
	'libxtst'
	'zlib')
install=teamviewer.install
source_x86_64=("http://download.teamviewer.com/download/version_${pkgver%%.*}x/teamviewer_${pkgver}_amd64.deb")
source_i686=("http://download.teamviewer.com/download/version_${pkgver%%.*}x/teamviewer_${pkgver}_i386.deb")
sha256sums_x86_64=('e3e969d1bd20662b9065ddf146308241d08cdd876dee66de29be4a7603e571af')
sha256sums_i686=('ff03beed49fcadfc633b08e6cfa7a7043d7d109e355a7f336a35f75f2e3e3ca1')

prepare() {
	tar -xf data.tar.bz2
}

package() {
	# Install
	cp -dr --no-preserve=ownership {etc,opt,usr,var} "${pkgdir}"/

	# Additional files
	rm "${pkgdir}"/opt/teamviewer/tv_bin/xdg-utils/xdg-email
	install -D -m0644 "${pkgdir}"/opt/teamviewer/tv_bin/script/teamviewerd.service \
		"${pkgdir}"/usr/lib/systemd/system/teamviewerd.service
	install -d -m0755 "${pkgdir}"/usr/{share/applications,share/licenses/teamviewer}
	ln -s /opt/teamviewer/tv_bin/desktop/teamviewer-teamviewer${pkgver%%.*}.desktop \
		"${pkgdir}"/usr/share/applications/teamviewer.desktop
	ln -s /opt/teamviewer/License.txt \
		"${pkgdir}"/usr/share/licenses/teamviewer/LICENSE
}

