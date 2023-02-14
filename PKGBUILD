# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Maz <m47h4r at gmail dot com>

pkgname=nekoray
pkgver=2.16
_releasedate=2023-02-14
pkgrel=1
pkgdesc="Qt based cross-platform GUI proxy configuration manager (backend: v2ray / sing-box)"
arch=('x86_64')
url="https://github.com/MatsuriDayo/nekoray"
license=('GPL 3.0')
groups=()
depends=('qt5-base>=5.15' 'qt5-svg' 'qt5-tools' 'qt5-x11extras')
provides=('nekoray')
conflicts=('nekoray-git')
optdepends=(
    'v2ray-domain-list-community: geosite data for NekoRay'
    'v2ray-geoip: geoip data for NekoRay'
)

install=notice.install

source=(
	"${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/nekoray-${pkgver}-${_releasedate}-linux64.zip"
	"nekoray.desktop"
)

sha256sums=(
	'aab1aa542daf3351de6267a88108a7230374b2c4020d6b5106d39263cd891995'
	'86f1332c81be2c346a4cdc80a3550f6484ef89e4ee8d4f23afada0c2d0a184e2'
)

package() {
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/lib/nekoray/
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/apps/

  install -Dt ${pkgdir}/usr/lib/${pkgname}/ -m755 ./nekoray/nekobox_core
  install -Dt ${pkgdir}/usr/lib/${pkgname}/ -m755 ./nekoray/nekoray_core
  install -Dt ${pkgdir}/usr/lib/${pkgname}/ -m755 ./nekoray/nekoray

	ln -s /usr/lib/${pkgname}/nekoray ${pkgdir}/usr/bin/nekoray

	install -Dt ${pkgdir}/usr/share/applications/ -m644 ./nekoray.desktop
	install -Dt ${pkgdir}/usr/share/icons/hicolor/128x128/apps/ -m644 ./nekoray/nekoray.png
}

