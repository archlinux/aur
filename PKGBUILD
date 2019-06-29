# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Jonathan Steel <jsteel at aur.archlinux.org>
# Contributor: Sebastian Wolf < fatmike303 at gmail dot com >
# Contributor: Guilherme Calé <gui@cabritacale.eu>

pkgname=fs-uae
pkgver=3.0.0
pkgrel=1
pkgdesc='An Amiga emulator based on UAE/WinUAE with a focus on emulating games'
arch=('x86_64')
url='https://fs-uae.net/'
license=('GPL2')
depends=('sdl2' 'glib2' 'libpng' 'openal' 'libx11' 'libmpeg2' 'zlib'
         'shared-mime-info' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('freetype2' 'gettext' 'libxi' 'mesa' 'zip')
source=("https://fs-uae.net/stable/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('221568b8f78bac352f84297f0cabe984d3da4f808e39cc3191541c02b389c964')

build() {
    cd "${pkgname}-${pkgver}"
    
    # need to disable the jit compiler to add PIE to binaries
    ./configure --prefix='/usr' --disable-jit
    
    make 
}

package() {
    cd "${pkgname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
}
