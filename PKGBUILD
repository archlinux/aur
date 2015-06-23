# Maintainer: John Jenkins twodopeshaggy@gmail.com
# Contributor: Shanto (at Hotmail)
# Contributor: Roger Braun <davinelulinvega@gmail.com>
# Contributor: Lee.MaRS <leemars@gmail.com>
# Contributor: kevku <kevku@gmx.com>
# Contributor: Higor Eurípedes <heuripedes@gmail.com>

# http://ardownload.adobe.com/pub/adobe/reader/win/11.x/11.0.03/en_US/AdbeRdr11003_en_US.exe

pkgname=ttf-adobe-fonts
pkgver=11.0.06
pkgrel=1
arch=('any')
pkgdesc="Fonts from Adobe Acrobat Reader X including Myriad Pro, Myriad CAD, Minion Pro, Courier Std and Adobe Pi Std"
url="http://www.adobe.com/products/reader.html"
source=(
	"http://ardownload.adobe.com/pub/adobe/reader/win/${pkgver%%.*}.x/${pkgver}/en_US/AdbeRdr${pkgver//./}_en_US.exe"
	"LICENSE"
)
md5sums=('8fae6f3fdf8d3f083d6a8f3ce22b36d0'
         'd4d2d30b83bb8e9578ebc22676e328b3')
makedepends=('p7zip')
conflicts=('acroread-fonts-systemwide')
install=${pkgname}.install
license=('custom')
noextract=($(basename ${source[0]}))

package() {
	cd "$srcdir"
	7z -y e $(basename ${source[0]})
	mkdir -p $pkgdir/usr/share/{fonts/OTF,licenses/$pkgname}
	7z -y -o"$pkgdir/usr/share/fonts/OTF" -ir\!*.otf e Data1.cab
	install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
