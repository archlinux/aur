## Maintainer: Konrad L. <nat@nekopon.pl>

pkgname=jazz2-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="Jazz² Resurrection: An open-source reimplementation of Jazz Jackrabbit 2"
arch=('x86_64')
url="http://deat.tk/jazz2/"
license=('GPL3')
depends=(mono openal)
options=("!strip")
install="${pkgname}.install"

source=("$pkgname-$pkgver.zip::https://github.com/deathkiller/jazz2/releases/download/$pkgver/Jazz2_${pkgver}_Desktop.zip"
        "$pkgname.png::https://raw.githubusercontent.com/deathkiller/jazz2/master/Jazz2.Android/Resources/mipmap-xxhdpi/ic_launcher.png"
        "jazz2.desktop"
        "jazz2"
        "jazz2import")

sha256sums=('d632139360781a534fc8d10ac17ca3370ef5bf846069f098f88220f0c98fc9c4'
            '21e0399e95bc84eafaec6c7b41a1b4f0a8cd843286f5ab5e0638ba27c1ebf4de'
            '4b8e7dbed18698f92fd774bb363f9d98093b3e6b797e543efaaa310fae4417fd'
            'c692cb282e6c7394544867bc4e14812bdc2e2b565b77441538ea7a6571d7ec23'
            'c26304e811702c6c06f4950e834b539a0e0c8d75393692e7896297d959ad305b')

package() {
	 # Install scripts
	 install -d "${pkgdir}"/usr/bin
	 install -Dm755 jazz2{,import} "${pkgdir}"/usr/bin

	 # Install image
	 install -Dm644 "${srcdir}"/"${pkgname}".png "${pkgdir}"/usr/share/pixmaps/jazz2.png

	 # Install desktop file
	 install -Dm644 jazz2.desktop "${pkgdir}"/usr/share/applications/jazz2.desktop

	 # Install game files
	 install -d "${pkgdir}"/opt/jazz2-bin
	 cp -r "${srcdir}"/Jazz2/* "${pkgdir}"/opt/jazz2-bin
	 install -Dm755 "${srcdir}"/Jazz2/Jazz2.exe "${pkgdir}"/opt/jazz2-bin
}
