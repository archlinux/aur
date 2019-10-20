# Maintainer: Maxime Tréca <maxime.treca@gmail.com>
pkgname=envypn-otb
pkgver=1.7.1
pkgrel=3
pkgdesc="Readable bitmap font inspired by Envy Code R"
url="http://ywstd.fr/p/pj/#envypn"
arch=('any')
license=('custom:MirOS License')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('git' 'fonttosfnt-git')
conflicts=('envypn-font')
source=("http://ywstd.fr/files/p/envypn-font/envypn-font-${pkgver}.tar.gz")
md5sums=('976ceda01018d3b109a735daf4e8af95')
sha256sums=('bda67b6bc6d5d871a4d46565d4126729dfb8a0de9611dae6c68132a7b7db1270')

_ex_pt() {
	_pt=${1%.bdf}
	_pt=${_pt#*-}
	echo $_pt
}

package() {
	cd "${srcdir}/envypn-font-${pkgver}"
	for f in *.pcf.gz; do
		fonttosfnt -o "${f/pcf.gz/otb}" "$f"
	done
	for i in *.otb; do
		install -Dm 644 $i "$pkgdir/usr/share/fonts/misc/$i"
	done
}



