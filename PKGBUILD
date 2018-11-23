# Maintainer: Katie Wolfe <katie@dnaf.moe>
pkgname=igdm
pkgver=2.5.4
pkgrel=2
pkgdesc="Desktop application for Instagram DMs"
arch=('x86_64' 'i686')
url="https://github.com/ifedapoolarewaju/igdm"
license=('MIT')
groups=()
depends=('glibc' 'gtk3' 'nss')
makedepends=('libarchive')
checkdepends=()
optdepends=()
provides=('igdm')
conflicts=('igdm')
changelog=
source_x86_64=("https://github.com/ifedapoolarewaju/igdm/releases/download/v$pkgver/IGdm-$pkgver.zip")
source_i686=("https://github.com/ifedapoolarewaju/igdm/releases/download/v$pkgver/IGdm-$pkgver-ia32.zip")
noextract=("IGdm-$pkgver.zip" "IGdm-$pkgver-ia32.zip")
sha256sums_x86_64=('ac6c246771c9c30707e2dd964bbef71f9189ad1b3f400b72faa7e38dbd4015e7')
sha256sums_i686=('1f7356a47a848e88def24abadcf7ef5ba8e0a26a9404a8766a35d0d39d783b64')
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

	# Install symlink /usr/bin/igdm -> /opt/igdm/igdm
	install -d "$pkgdir/usr/bin"
	ln -s "/opt/${pkgname}/igdm" "$pkgdir/usr/bin/igdm"
}
