# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Maz <m47h4r at gmail dot com>

pkgname=nekoray
pkgver=2.9
_releasedate=2022-12-19
pkgrel=1
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
	'789cef694f1f2be55fb2af0c91c6deb297604f63639d47634481c55d6d178f56'
	'dd7083c3992d35ad51beb73bfb3ef42f82ebee6c3ab9a25e9dfe8c6bd95096ce'
	'13986ecce89ddaac4b25fc5e78e1208e2f69bfd3fb86acf2308f218c06e6f5ad'
)

package() {
	cd $srcdir
	unzip "${pkgname}-${pkgver}.zip"
	chown -R "$USER":"$USER" "nekoray"
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
