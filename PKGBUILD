# Maintainer: George Woodall <georgewoodall82@gmail.com>
pkgname=bambustudio-bin
pkgver=01.07.04.52
pkgrel=1
pkgdesc="PC Software for BambuLab's 3D printers"
arch=("x86_64")
url="https://github.com/bambulab/BambuStudio"
license=('AGPL-3.0')
conflicts=('bambustudio' 'bambustudio-git')
depends=('mesa' 'glu' 'cairo' 'gtk3' 'libsoup' 'webkit2gtk' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'harmonyos-sans-git')
makedepends=('fuse2')
source=("bambustudio-${pkgver}.AppImage::https://github.com/bambulab/BambuStudio/releases/download/v${pkgver}/Bambu_Studio_linux_fedora-v${pkgver}.AppImage")
md5sums=('SKIP')

package() {
    cd "$srcdir"
    chmod +x ./bambustudio-${pkgver}.AppImage
    ./bambustudio-${pkgver}.AppImage --appimage-extract
    cd squashfs-root
    mkdir $pkgdir/opt/
    mkdir $pkgdir/opt/bambustudio-bin
    cp -r ./usr "$pkgdir/"
    cp -r ./* "$pkgdir/opt/bambustudio-bin/"
    
    echo "#!/bin/bash
exec \"/opt/bambustudio-bin/AppRun\"">./bambu-studio
    
    chmod +x ./bambu-studio
    mkdir "$pkgdir/usr/bin/"
    cp ./bambu-studio "$pkgdir/usr/bin/"
    
    mkdir "$pkgdir/usr/share/applications/"
    echo "[Desktop Entry]
Name=BambuStudio
Exec=/usr/bin/bambu-studio %F
Icon=BambuStudio
Type=Application
Categories=Utility;
MimeType=model/stl;application/vnd.ms-3mfdocument;application/prs.wavefront-obj;application/x-amf;">"$pkgdir/usr/share/applications/BambuStudio.desktop"
}
