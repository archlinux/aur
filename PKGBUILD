# Maintainer: Tyler Anderson <unlimitedbacon@gmail.com>

# This script simply downloads the MatterControl .deb release, unpacks it,
# and copies all necessary files.

# To update the package, change pkgver and _buildtoken.
# Get _buildtoken from MCWS download URL.
# Afterwards, run updpkgsums and mksrcinfo.

pkgname=mattercontrol
_pkgname=MatterControl
pkgver=2.19.10.10370
pkgrel=2
pkgdesc="Software solution for 3D printers"
arch=('any')
license=('custom')
url="http://www.mattercontrol.com"
depends=('mono' 'gtk-sharp-2')
provides=('mattercontrol')
conflicts=('mattercontrol-plugins')
install="mattercontrol.install"
_projecttoken=ag9zfm1hdHRlcmNvbnRyb2xyFAsSB1Byb2plY3QYgICAiOCSzAsM
_buildtoken=ag9zfm1hdHRlcmNvbnRyb2xyQQsSB1Byb2plY3QYgICAiOCSzAsMCxINUHVibGljUmVsZWFzZRiAgIDg1_GcCgwLEgZVcGxvYWQYgIDQiJunnQsM
source=("MatterControlSetup-$pkgver.deb::https://mattercontrol.appspot.com/downloads/development/$_buildtoken"
	'mattercontrol'
	'mattercontrol.desktop'
	'mattercontrol.png'
	'mattercontrol.install'
	'LICENSE')
sha256sums=('9f3163cb9b96c3a9803aec416ba28d51e5f6adcb88a07b585a23a8a0f60a1e9c'
            '4954c0de00d6701d37c15c73d3509d0d91e67339c08afa3b273e9343dfd5cc61'
            '89854894868127bdb8d7ebdef8cccf1c528b0a07e526380dcc0e1024a15c033c'
            '6470dfabd982109638c2e9fc01acca51dc1109ce07aec261dbc4c86ead9f9927'
            '41e907de000d6b57c7788229a36ff4b247de928597401631e2b1036fdf97aa77'
            '2731cdbc5d3916af68c1d5ffa2d3e3a3cfae6817ce5561d91f8bc565a3401982')

build() {
        cd "${srcdir}"
        ar -x "MatterControlSetup-$pkgver.deb"
        tar -xvf data.tar.xz
}

package() {
	cd "${srcdir}/usr/lib/mattercontrol"
	install -d "$pkgdir/usr/lib/mattercontrol/"
	cp -r * "$pkgdir/usr/lib/mattercontrol/"

	cd "${srcdir}"
	install -Dm755 mattercontrol "$pkgdir/usr/bin/mattercontrol"
	install -Dm644 mattercontrol.desktop "$pkgdir/usr/share/applications/mattercontrol.desktop"
	install -Dm644 mattercontrol.png "$pkgdir/usr/share/icons/mattercontrol.png"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/mattercontrol/LICENSE"
}
