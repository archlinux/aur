# Maintainer: Gilwiljam <gillbilljam@gmail.com>
pkgname=rmg-k-bin
_pkgname=rmg-k 
pkgver=0.9.13
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
sha512sums=('dcb6f8120667648987444ff847920a60ebfa832a7467acf1decb7c17d9a23b33a3d84b4ca8faf533147e933137fa2a028e526d525d9dfe2e5941f6ae6991c682'
            'SKIP'
            'SKIP')

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
