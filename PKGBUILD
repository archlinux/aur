# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=wg++
pkgver=5.1.4
pkgrel=1
pkgdesc="WebGrab+Plus is a multi-site incremental xmltv epg grabber"
arch=(any)
url="http://webgrabplus.com/"
license=(custom)
depends=(dotnet-runtime-7.0)
source=("${pkgname}-5.1.0.tar.gz::http://webgrabplus.com/sites/default/files/download/SW/V5.1.0/WebGrabPlus_V5.1_install.tar_0.gz"
	"${pkgname}-${pkgver}.tar.gz::http://webgrabplus.com/sites/default/files/download/SW/V${pkgver}/WebGrabPlus_V${pkgver}_beta_install.tar.gz"
	'wgpp.sh')
sha256sums=('368b14be4b0ec724ac394b59b26c05ecff3cef2864572a8cca844d56e1ce6f0f'
            'cdd948bea5d604ce82297597e1d232fc4c06970bb415b4f9ac1bdba2f6624f24'
            'e6bbd6c1710c7114a6dc201529616cb38f8ca636b94ecbf9d98328c9affd6d1d')

prepare() {
	# Rename folder
	mv .$pkgname $pkgname
	# Run install.sh script
	cd $pkgname
	./install.sh
}

package() {
	install -d "$pkgdir"/usr/share/$pkgname
	cp -r --preserve=mode $pkgname "$pkgdir"/usr/share
	install -Dm755 "$srcdir"/wgpp.sh "$pkgdir"/usr/bin/$pkgname
}
