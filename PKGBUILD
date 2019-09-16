# Maintainer: Katie Wolfe <katie@dnaf.moe>
pkgname=igdm
pkgver=2.7.1
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
sha512sums_x86_64=('5a8ff9185e9f145b860ab578f431f1f14371fd86178ff4d7cc62a3ca07b4a713c7209c2ae15ed8f8f2cd768c570f1086f9d9432680b8425e0fa137da9ab027af')
sha512sums_i686=('68683911ec40ae9683dc01c53e8ebc24b1447d3ff1d2a7e440824658db714a9c8be1f1601d4dd23e6f93bc2c4e9f0d15406e5c53f668ae6c9e072f5340525ff4')
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
