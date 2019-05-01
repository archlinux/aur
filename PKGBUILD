# Maintainer: Katie Wolfe <katie@dnaf.moe>
pkgname=igdm
pkgver=2.6.5
pkgrel=2
pkgdesc="Desktop application for Instagram DMs"
arch=('x86_64' 'i686')
url="https://github.com/ifedapoolarewaju/igdm"
license=('MIT')
groups=()
depends=('glibc' 'gtk3' 'nss' 'gconf')
makedepends=('libarchive')
checkdepends=()
optdepends=()
provides=('igdm')
conflicts=('igdm')
changelog=
source_x86_64=("https://github.com/ifedapoolarewaju/igdm/releases/download/v$pkgver/IGdm-$pkgver.zip")
source_i686=("https://github.com/ifedapoolarewaju/igdm/releases/download/v$pkgver/IGdm-$pkgver-ia32.zip")
source=("${pkgname}.desktop")
noextract=("IGdm-$pkgver.zip" "IGdm-$pkgver-ia32.zip")
sha256sums=('50d0ac59bacc71f5037fa521be562eaf8d4a6ff9a945d18482f3ce81d9c9da9a')
sha256sums_x86_64=('ddd097e7ecbe77fe425e09d70f87c5d4adb3bd6158bc81488b8cdb3012fde0dc')
sha256sums_i686=('93275b0c9bab26edecd9fe1ec8df89264ce3ffa9cee1692c642562c1ea4b6e15')
validpgpkeys=()

package() {
	# Extract stuff to its own subdirectory
	cd "$srcdir"
	mkdir -p igdm
	if [ "${arch}" = 'x86_64' ]; then
		bsdtar -xf "IGdm-${pkgver}.zip" -C igdm
	else
		bsdtar -xf "IGdm-${pkgver}-ia32.zip" -C igdm
	fi

	# Install igdm to /opt/igdm
	install -d "$pkgdir/opt/${pkgname}"
	cd 'igdm'
	cp -a '.' "$pkgdir/opt/${pkgname}"
	cd ..

	# Install symlink /usr/bin/igdm -> /opt/igdm/igdm
	install -d "$pkgdir/usr/bin"
	ln -s "/opt/${pkgname}/igdm" "$pkgdir/usr/bin/igdm"

	# Install desktop entry
	install -Dm=644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
