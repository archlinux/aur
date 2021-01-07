# Maintainer: Katie Wolfe <katie@dnaf.moe>
pkgname=igdm
pkgver=3.0.1
pkgrel=1
pkgdesc="Desktop application for Instagram DMs"
arch=('x86_64' 'i686')
url="https://github.com/igdmapps/igdm"
license=('MIT')
groups=()
depends=('glibc' 'gtk3' 'nss' 'gconf')
makedepends=('libarchive')
checkdepends=()
optdepends=()
provides=('igdm')
conflicts=('igdm')
changelog=
source_x86_64=("https://github.com/igdmapps/igdm/releases/download/v$pkgver/IGdm-$pkgver.zip")
source_i686=("https://github.com/igdmapps/igdm/releases/download/v$pkgver/IGdm-$pkgver-ia32.zip")
source=("${pkgname}.desktop")
noextract=("IGdm-$pkgver.zip" "IGdm-$pkgver-ia32.zip")
sha512sums=('3389360a07b982774c4043684b1a0d63ace26a5a4106b052748b806ada8f2aa9a94991e144cb2bdda50aa859bb478237cb201d5864b565f4590b84745df8583c')
sha512sums_x86_64=('e598e959915624521d3e7ca212ef26c55f0a0093d742b8b7586e4c0a82a3cf763e1c45f47c47849d8a8a54371367a6493d77479bf28a09cf6748e6578948fec2')
sha512sums_i686=('7aac2dd7a6e2e40310509bc1f33f60913b4e7a424218966632a09021867e4343194ed10b1e421b62a91f116b99c7623efba62ac6b7685a90813e4700cc3a2cd2')
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
