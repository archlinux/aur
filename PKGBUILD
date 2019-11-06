# Maintainer: Katie Wolfe <katie@dnaf.moe>
pkgname=igdm
pkgver=2.8.1
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
sha512sums_x86_64=('18953485759236432a6a67d71a530718455a8405d79be86cbdccca9c523cc6e0a5498219acdfa6f3b668ebbff5dd5a9d7e2210493c0f3c13beb0ed517e781267')
sha512sums_i686=('4cdec64dd0e2d98a3aa7971f8169a81f4f95592df9d2050187962e1ecd1c311cbd5a2329900d4273d1d6dac28c520270b57eef0991fb3f3038b2f098d9ab194f')
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
