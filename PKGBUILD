# Maintainer: George Woodall <georgewoodall82@gmail.com>
pkgname=bambustudio-bin
pkgver=01.08.04.51
pkgrel=1
pkgdesc="PC Software for BambuLab's 3D printers"
arch=("x86_64")
url="https://github.com/bambulab/BambuStudio"
license=('AGPL3')
conflicts=('bambustudio' 'bambustudio-git')
depends=('mesa' 'glu' 'cairo' 'gtk3' 'libsoup' 'webkit2gtk' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'ttf-harmonyos-sans' 'gst-plugins-good' 'gst-plugins-bad')
makedepends=('fuse2')
source=(
	"bambustudio-${pkgver}.AppImage::https://github.com/bambulab/BambuStudio/releases/download/v${pkgver}/BambuStudio_linux_ubuntu_v${pkgver}_20240117.AppImage"
	"BambuStudio.desktop"
	"bambu-studio")
md5sums=('6c848332763a27193eea135327d8b5db'
         'c2729c29cbd01844507e1f0562762191'
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
