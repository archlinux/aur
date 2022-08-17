# Maintainer: Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>
_PkgName=LabelPlus
pkgname=labelplus-bin
pkgver=1.2.6
pkgrel=1
pkgdesc="Easy tool for comic translation. Reduce communication costs of translator. Export text to Photoshop.."
arch=(any)
url=https://noodlefighter.com/label_plus/
license=(GPL2)
depends=(mono)
makedepends=(p7zip)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
backup=()
options=('!strip')
install=
source=(
	labelplus
	"${pkgname%-bin}-$pkgver.7z::https://github.com/$_PkgName/$_PkgName/releases/download/v1.2.6/$_PkgName$pkgver.7z"
)
sha1sums=(
	caf11dc83e6da4b153d1b45b8d2d9425dabfe419
	375a7808112d2101fcfc440c5883f1e73135176c
)

prepare() {
	sed -i 's/ZH/EN/g' Lang/DefaultLanguage.xml
	rm -fv LICENSE.txt
}

package() {

	rm -v labelplus-1.2.6.7z

	install -vdm755 "$pkgdir"/usr/lib
	mv -v LabelPlus.exe "$_"/

	install -vdm755 "$pkgdir"/usr/bin
	install -vDm755 labelplus "$_"/labelplus
	rm -v labelplus

	install -vdm755 "$pkgdir"/usr/share/doc/${pkgname%-bin}
	mv -v \
		'README.md' \
		'Version History.txt' \
		"$_"/

	install -vdm755 "$pkgdir"/usr/share/${pkgname%-bin}
	mv * "$_"/

	# { echo; echo ":; cd $PWD"; echo; return 1; }

}
