pkgname=qolibri-bin
conflicts=(qolibri)
pkgver=2.1.4
pkgrel=5
pkgdesc="A QT-based EPWING dictionary viewer"
url="https://github.com/mvf/qolibri/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libnsl' 'qt5-base' 'qt5-tools' 'qt5-multimedia' 'qt5-webengine' 'zlib' 'libeb')
makedepends=('libarchive')
source=("https://github.com/mvf/qolibri/releases/download/${pkgver}/qolibri_${pkgver}_amd64.deb")
sha1sums=('9c2d723bed6ac53fa5ab9f55f0ca9ee21d7a65d3')

package() {
	mkdir -p \
		"$pkgdir/usr/share/applications" \
		"$pkgdir/usr/lib/" \
		"$pkgdir/usr/share/icons/hicolor/128x128/apps/"

	bsdtar -xf data.tar.xz -C "$pkgdir"
	ln -s /usr/lib/libnsl.so "$pkgdir/usr/lib/libnsl.so.2"
	curl \
		"https://raw.githubusercontent.com/mvf/qolibri/prime/images/qolibri-128.png" \
		-o "$pkgdir/usr/share/icons/hicolor/128x128/apps/qolibri.png"
	cat <<-EOF > "$pkgdir/usr/share/applications/qolibri.desktop"
	[Desktop Entry]
	Name=qolibri
	Comment=A QT-based EPWING dictionary viewer
	GenericName=dictionary
	Exec=qolibri
	Icon=qolibri
	Categories=Education;Languages;Qt;
	Terminal=false
	Type=Application
	Version=1.0
	EOF
}
