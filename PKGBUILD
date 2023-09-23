# Maintainer: George Woodall <georgewoodall82@gmail.com>
pkgname=bambustudio-bin
pkgver=01.07.06.92
pkgrel=3
pkgdesc="PC Software for BambuLab's 3D printers"
arch=("x86_64")
url="https://github.com/bambulab/BambuStudio"
license=('AGPL3')
conflicts=('bambustudio' 'bambustudio-git')
depends=('mesa' 'glu' 'cairo' 'gtk3' 'libsoup' 'webkit2gtk' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'ttf-harmonyos-sans')
makedepends=('fuse2')
source=(
	"bambustudio-${pkgver}.AppImage::https://github.com/bambulab/BambuStudio/releases/download/v${pkgver}/Bambu_Studio_linux_fedora_v${pkgver}-20230923002726.AppImage"
	"BambuStudio.desktop"
	"bambu-studio")
md5sums=('17ae1c4a56627ca5dcbe4b95ae9e3616'
         'bb919dd5d4fc480575fe1706915f978b'
         'dfc63a9eabda3cc7172695bb1ba09c51')

package() {
    cd "$srcdir"
    chmod +x ./bambustudio-${pkgver}.AppImage
    ./bambustudio-${pkgver}.AppImage --appimage-extract
    cd squashfs-root
    mkdir $pkgdir/opt/
    mkdir $pkgdir/opt/bambustudio-bin
    cp -r ./usr "$pkgdir/"
    cp -r ./* "$pkgdir/opt/bambustudio-bin/"
    
    cd "$srcdir"
    
    mkdir "$pkgdir/usr/bin/"
    chmod +x ./bambu-studio
    cp ./bambu-studio "$pkgdir/usr/bin/"
    
    mkdir "$pkgdir/usr/share/applications/"
    cp ./BambuStudio.desktop "$pkgdir/usr/share/applications/BambuStudio.desktop"
}
