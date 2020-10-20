# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=edge
pkgver=88.0.673.0
_pkgrel=1
pkgrel=3
pkgdesc='Cross-platform web browser based on Chromium'
arch=('x86_64')
url='https://www.microsoft.com/en-us/edge'
license=('custom')
depends=('gtk3' 'nss')
options=('!strip')
source=("https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-dev/microsoft-edge-dev_${pkgver}-${_pkgrel}_amd64.deb")
noextract=("microsoft-edge-dev_${pkgver}-${_pkgrel}_amd64.deb")
sha256sums=('ffd002c232bfb54f23648bd56e4bec60c74eae35c19f1e45c15e84a2a114d3e1')

package() {
	bsdtar -O -xf "microsoft-edge-dev_${pkgver}-${_pkgrel}_amd64.deb" data.tar.xz |
		bsdtar -C "${pkgdir}" --exclude etc --exclude opt/microsoft/msedge-dev/cron --strip 1 -xJf -

	for size in 16 24 32 48 64 128 256; do
		install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
		ln -sf /opt/microsoft/msedge-dev/product_logo_${size}_dev.png \
			"${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/microsoft-edge-dev.png"
	done
}
