# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Maz <m47h4r at gmail dot com>

pkgname=nekoray
pkgver=2.14
_releasedate=2023-02-04
pkgrel=2
pkgdesc="Qt based cross-platform GUI proxy configuration manager (backend: v2ray / sing-box)"
arch=('x86_64')
url="https://github.com/MatsuriDayo/nekoray"
license=('GPL 3.0')
groups=()
depends=('qt5-base>=5.15' 'qt5-svg' 'qt5-tools' 'qt5-x11extras')
makedepends=('unzip')
provides=('nekoray')
conflicts=('nekoray')
noextract=("${pkgname}-${pkgver}.zip")
source=(
	"${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/nekoray-${pkgver}-${_releasedate}-linux64.zip"
	"nekoray.desktop"
	"launcher-script"
)
sha256sums=(
	'c483a5debd37c17cca5e98d6808f06f6d836a4a46985f4a60d0de4128c5d6e24'
	'dd7083c3992d35ad51beb73bfb3ef42f82ebee6c3ab9a25e9dfe8c6bd95096ce'
	'13986ecce89ddaac4b25fc5e78e1208e2f69bfd3fb86acf2308f218c06e6f5ad'
)

package() {
	cd $srcdir
	unzip "${pkgname}-${pkgver}.zip"
	chown -R "$USER":"$(id -g)" "nekoray"
	install -dm700 "${pkgdir}${HOME}"
	install -dm700 "${pkgdir}${HOME}/.local"
	install -dm755 "${pkgdir}${HOME}/.local/opt"
	cp -p -r "nekoray" "${pkgdir}${HOME}/.local/opt"
	# Launcher script
	install -dm755 "${pkgdir}/usr/bin"
	cp -p "launcher-script" "${pkgdir}/usr/bin/nekoray"
	# Desktop file
	install -dm700 "${pkgdir}${HOME}/.local/share"
	install -dm755 "${pkgdir}${HOME}/.local/share/applications"
	sed "s,~,$HOME," "nekoray.desktop" > \
		"${pkgdir}${HOME}/.local/share/applications/nekoray.desktop"
	# Icon
	install -d -m755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
	ln -s "${HOME}/.local/opt/nekoray/nekoray.png" \
		"${pkgdir}/usr/share/icons/hicolor/128x128/apps/nekoray.png"
}
