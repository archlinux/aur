# Maintainer: Xandar Null <xandar.null@gmail.com>

pkgname=freezer-bin
_pkgname_=freezer
pkgver=1.1.23
pkgrel=1
pkgdesc="Free HQ music streaming app (Official)"
arch=(x86_64)
url="https://git.rip/freezer/freezerpc/"
license=('GPL')
provides=(freezer-bin)
depends=(openssl libnotify libappindicator-gtk3 libxtst nss)
conflicts=(freezer-git freezer-appimage)
source=(
	"$_pkgname_.desktop"
	"$_pkgname_.sh"
	https://git.freezer.life/exttex/freezerpc/raw/branch/master/app/assets/icon.png
)
source_x86_64=("https://files.freezer.life/0:/PC/1.1.23/freezer_1.1.23_amd64.deb")

build() {
	
	# Extraction
	mkdir -p "${srcdir}/output"
	tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output"
}

package() {

	# Installation
	cp -r "${srcdir}/output/"* "${pkgdir}"
	
	# Install to /usr/bin
	install -Dm755 "$srcdir/$_pkgname_.sh" "$pkgdir/usr/bin/$_pkgname_"

	# Desktop launcher
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"
	install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/freezer.png"
	install -Dm644 "$srcdir/$_pkgname_.desktop" "$pkgdir/usr/share/applications/$_pkgname_.desktop"
}
sha256sums=('130f11c9d9e41c23ff2f5ddfed2820a0a0997611e8067d077db0a4cf4cd76070'
            '780e71d3423d5d1838f144a1954216324f833673d8b48365535ad8e31da1ea98'
            '5431bc4b525071e0d53c971eff9fa7c3a906bfe1823a7598f82df79bbfe981d7')
sha256sums_x86_64=('bc6cc09d2aa297da908b876efc8e955fc99a9f17359604c91601bdacedf11989')
