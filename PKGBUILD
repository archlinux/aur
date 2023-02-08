# Maintainer: Molyuu <zhangjtroger@gmail.com>
pkgname='nekoray-bin'
pkgver=2.14
_releasedate=2023-02-04
pkgrel=1
pkgdesc='Qt based cross-platform GUI proxy configuration manager (backend: v2ray / sing-box)'
arch=('x86_64')
url='https://github.com/MatsuriDayo/nekoray'
license=('GPL 3.0')
depends=(
    'qt5-base' 'qt5-svg' 'qt5-tools' 'qt5-x11extras'
)
conflicts=('nekoray' 'nekoray-git')

optdepends=(
    'v2ray-domain-list-community: geosite data for NekoRay'
    'v2ray-geoip: geoip data for NekoRay'
    'hysteria: Hysteria support for Nekoray'
    # AUR
    'sing-geoip: geoip data for NekoBox'
    'sing-geosite: geosite data for NekoBox'
)

source=(
    "https://github.com/MatsuriDayo/nekoray/releases/download/$pkgver/nekoray-$pkgver-$_releasedate-linux64.zip"
    'nekoray.desktop'
    'launcher.sh'
)
sha256sums=(
    'c483a5debd37c17cca5e98d6808f06f6d836a4a46985f4a60d0de4128c5d6e24'
    'f91e598c4fb016527c05702357178126ed2faae1f7e6e71a47afde520832c33d'
    '321e35182d6c43fcb27e021cd2b2d50e9869e34610409bf5496919e88233cc11'
)

package() {
	# Prepare
	cd $srcdir
    rm -rf nekoray
	unzip "nekoray-$pkgver-$_releasedate-linux64.zip"
	chown -R "$USER":"$USER" "nekoray"
	mkdir -p "${pkgdir}/usr/lib/nekoray"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
	# icons & desktop
	cp "${srcdir}/nekoray.desktop" "${pkgdir}/usr/share/applications/nekoray.desktop"
    cp -a "${srcdir}/nekoray/nekoray.png" "${pkgdir}/usr/lib/nekoray/"
    cp -a "${srcdir}/nekoray/nekobox.png" "${pkgdir}/usr/lib/nekoray/"
    ln -s "/usr/lib/nekoray/nekoray.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/nekoray.png"
    ln -s "/usr/lib/nekoray/nekobox.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/nekobox.png"
	# binary
	cp -a "${srcdir}/nekoray/nekoray_core" "${pkgdir}/usr/lib/nekoray/"
	cp -a "${srcdir}/nekoray/nekobox_core" "${pkgdir}/usr/lib/nekoray/"
	cp -a "${srcdir}/nekoray/nekoray" "${pkgdir}/usr/lib/nekoray/"
	ln -s  "/usr/lib/nekoray/nekoray" "${pkgdir}/usr/bin/nekoray"
}