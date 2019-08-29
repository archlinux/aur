# Maintainer: Katie Wolfe <katie@dnaf.moe>
pkgname=igdm
pkgver=2.7.0
pkgrel=1
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
sha512sums=('3389360a07b982774c4043684b1a0d63ace26a5a4106b052748b806ada8f2aa9a94991e144cb2bdda50aa859bb478237cb201d5864b565f4590b84745df8583c')
sha512sums_x86_64=('cb8fb27ab414543189e50fb469f52a0e24c88021328bd2bcfdaace341d5c6ef1a9ef370a617fb3664835911acb18180c174cba1d4f887230a7969f1ee54c4f76')
sha512sums_i686=('65b231e9f7a8baa5b99c5197ffe5260ef4a5c04339bb1ec14e252a45169633f6a150111c839c6107144e50d53da728ff8999ac9fe4b7a6d01bb1735a4e373f06')
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
