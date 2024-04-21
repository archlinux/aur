# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=wg++
pkgver=5.1.5
pkgrel=2
pkgdesc="WebGrab+Plus is a multi-site incremental xmltv epg grabber"
arch=(any)
url="http://webgrabplus.com/"
license=(custom)
depends=(
	dotnet-runtime-8.0
	libxml2
)
source=("${pkgname}-5.1.0.tar.gz::http://webgrabplus.com/sites/default/files/download/SW/V5.1.0/WebGrabPlus_V5.1_install.tar_0.gz"
	"${pkgname}-${pkgver}.tar.gz::http://webgrabplus.com/sites/default/files/download/SW/V${pkgver}/WebGrabPlus_V${pkgver}_beta_install.tar.gz"
	'wgpp.sh')
sha256sums=('368b14be4b0ec724ac394b59b26c05ecff3cef2864572a8cca844d56e1ce6f0f'
            '8d9b7cdff826ae4bd8aa8f033bafcf5bea6525b3b6fbdebf724918b1ba788ad0'
            '3e5873dcf4007156274b72d6094d79e1c73e735baf4be9a0c66757554f40419c')

prepare() {
	# Rename folder
	mv .$pkgname $pkgname
	# Run install.sh script
	cd $pkgname
	./install.sh
	sed -i 's/guide\.xml/latest\.xml/g' WebGrab++.config.xml
}

package() {
	install -d "$pkgdir"/usr/share/$pkgname
	cp -r --preserve=mode $pkgname "$pkgdir"/usr/share
	install -Dm755 "$srcdir"/wgpp.sh "$pkgdir"/usr/bin/$pkgname
}
