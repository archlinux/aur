# Maintainer: Yakir Sitbon <kingyes1 at gmail dot com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Stas S <whats_up at tut dot by>
# Contributor: Hilinus <itahilinus at hotmail dot it>

pkgname=teamviewer-beta
pkgver=11.0.50678
pkgrel=1
pkgdesc="All-In-One Software for Remote Support and Online Meetings - beta version"
arch=('i686' 'x86_64')
url="http://www.teamviewer.com"
license=('custom')
options=('!strip')
provides=('teamviewer')
conflicts=('teamviewer')
depends_x86_64=('gcc-libs'
	'alsa-lib'
	'freetype2'
	'libice'
	'libsm'
	'libxdamage'
	'libxinerama'
	'libxrandr'
	'libxtst'
	'zlib')
depends_i686=('lib32-gcc-libs'
	'lib32-alsa-lib'
	'lib32-freetype2'
	'lib32-libice'
	'lib32-libsm'
	'lib32-libxdamage'
	'lib32-libxinerama'
	'lib32-libxrandr'
	'lib32-libxtst'
	'lib32-zlib')
install=teamviewer.install
source_x86_64=("http://download.teamviewer.com/download/version_${pkgver%%.*}x/teamviewer_${pkgver}_amd64.deb")
source_i686=("http://download.teamviewer.com/download/version_${pkgver%%.*}x/teamviewer_${pkgver}_i386.deb")
sha256sums_x86_64=('b43a953ada4aef5228f0a49c75593beb997b256b5e24e525eb5cff56d7ad9abf')
sha256sums_i686=('1d2a4f3cb4516dda831dee841d5c024bd49a85d31e0c0b63020e433558ce9ce0')

prepare() {
	tar -xf data.tar.bz2
}

package() {
	# Install
	cp -dr --no-preserve=ownership {etc,opt,usr,var} "${pkgdir}"/

	# Additional files
	rm "${pkgdir}"/opt/teamviewer/tv_bin/xdg-utils/xdg-email
	install -D -m0644 "${pkgdir}"/opt/teamviewer/tv_bin/script/teamviewerd.service "${pkgdir}"/usr/lib/systemd/system/teamviewerd.service
	install -d -m0755 "${pkgdir}"/usr/{share/applications,share/licenses/teamviewer}
	ln -s /opt/teamviewer/tv_bin/desktop/teamviewer-teamviewer${pkgver%%.*}.desktop "${pkgdir}"/usr/share/applications/teamviewer.desktop
	ln -s /opt/teamviewer/License.txt "${pkgdir}"/usr/share/licenses/teamviewer/LICENSE
}

