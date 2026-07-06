# Maintainer: Gilwiljam <gillbilljam@gmail.com>
pkgname=rmg-k-bin
_pkgname=rmg-k 
pkgver=0.9.8
pkgrel=1
pkgdesc="Rosalie's Mupen GUI with the Kaillera netplay protocol"
arch=('x86_64') 
url="https://github.com/Jay-Day/RMG-K" 
license=('GPL-3.0-Only')
depends=('freetype2' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'hidapi' 'libgl' 'libusb' 'libpng' 'minizip' 'zlib' 'qt6-base' 'qt6-svg' 'qt6-websockets' 'sdl3' 'libsamplerate' 'vulkan-headers')
provides=('rmg-k') 
source=("RMG-K-Portable-Linux64-v${pkgver}.AppImage::${url}/releases/download/v${pkgver}/RMG-K-Portable-Linux64-v${pkgver}.AppImage" 
	"README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
	"LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
sha512sums=('1050c4d1eef4ab40e9e588fd46fc2a9eefeef0e4b51a63017d5563c3cbc293514af10c7543d2a5c35ffc2ad5af853573ec9e5ac3b2f31e71e9696e90a22781c7'
            'faa971fe1395e499e8f1eaa87038215a342104c6a33aa16bb2dc9c467738666ba179b8b2b5d7a79eb968f80c7ed1f30bf0ec5f82e9a12b32313790f574d30d5a'
            '900ef9b1d0e1435fb3aad32f035edf8890538292ebb3104af2feb386fb25df134ed0172a0ec542b2c25ff69a39ae62b34ad17e01b3522067a7328abb25aa4fff')

prepare() {
	cd "${srcdir}" 
	chmod +x "RMG-K-Portable-Linux64-v${pkgver}.AppImage" 
	./"RMG-K-Portable-Linux64-v${pkgver}.AppImage" --appimage-extract > /dev/null 	
}

package() {
	cd "${srcdir}" 
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md" 
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	cd "squashfs-root"
	find "share/applications" "share/icons" "share/metainfo" "share/RMG" -type f -exec \
    	  install -Dm644 "{}" "${pkgdir}/usr/{}" \;

	cd "shared"
  	find "bin" -type f -exec \
    	  install -Dm755 "{}" "${pkgdir}/usr/{}" \;
	
	find "lib/RMG" -type f -exec \
    	  install -Dm644 "{}" "${pkgdir}/usr/{}" \;
  	find "lib" -mindepth 1 -maxdepth 1 -type f -name "*RMG*" -exec \
          install -Dm644 "{}" "${pkgdir}/usr/{}" \;
}
