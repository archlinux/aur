## Maintainer: Konrad L. <nat@nekopon.pl>

pkgname=jazz2-bin
pkgver=0.6.7
pkgrel=1
pkgdesc="Jazz² Resurrection: An open-source reimplementation of Jazz Jackrabbit 2"
arch=('x86_64')
url="http://deat.tk/jazz2/"
license=('GPL3')
depends=(mono)
options=("!strip")
install="${pkgname}.install"

source=("$pkgname-$pkgver.zip::https://github.com/deathkiller/jazz2/releases/download/$pkgver/Jazz2_${pkgver}_Desktop.zip"
        "$pkgname.png::https://raw.githubusercontent.com/deathkiller/jazz2/master/Jazz2.Android/Resources/mipmap-xxhdpi/ic_launcher.png"
        "$pkgname-LICENSE::https://raw.githubusercontent.com/deathkiller/jazz2/master/LICENSE"
        "jazz2.desktop"
        "jazz2"
        "jazz2import")

noextract=("Jazz2_${pkgver}_Desktop.zip")

sha256sums=('5c6929184409c6313c6df36609755f7d73ebd04de9bfe52a1d61aa4f4d07610e'
            '21e0399e95bc84eafaec6c7b41a1b4f0a8cd843286f5ab5e0638ba27c1ebf4de'
            'd62f065830aa3739cc031156b9690805c7b2e811b4a178c8b4acd8725d561c94'
            '4b8e7dbed18698f92fd774bb363f9d98093b3e6b797e543efaaa310fae4417fd'
            '200bad11af3795caed6d19935f92c379ab223120aba7b88ebe580e8606284374'
            'b8ab457b05394a9a71df79906cf8a7ae8d13232bf15ba03baefb0256b0f2e6a7')

prepare() {
	 unzip "${pkgname}-${pkgver}.zip" -d "${srcdir}"/Jazz2
}

package() {
	 # Install scripts
	 install -d "${pkgdir}"/usr/bin
	 install -Dm755 jazz2{,import} "${pkgdir}"/usr/bin

	 # Install image
	 install -Dm644 "${srcdir}"/"${pkgname}".png "${pkgdir}"/usr/share/pixmaps/jazz2.png

	 # Install license
	 install -Dm644 "${srcdir}"/"${pkgname}"-LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENCE.md

	 # Install desktop file
	 install -Dm644 jazz2.desktop "${pkgdir}"/usr/share/applications/jazz2.desktop

	 # Install game files
	 install -d "${pkgdir}"/opt/jazz2-bin
	 cp -r "${srcdir}"/Jazz2/* "${pkgdir}"/opt/jazz2-bin
	 install -Dm755 -t "${pkgdir}"/opt/jazz2-bin "${srcdir}"/Jazz2/Jazz2.exe
}
