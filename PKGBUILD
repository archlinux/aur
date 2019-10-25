# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=motrix-bin
pkgver=1.4.1
pkgrel=2
pkgdesc='elegent downloading tool frontend for aria2c, using vue (binary version)'
arch=('x86_64')
url='https://motrix.app/'
license=('MIT')
conflicts=(
    'motrix'
    'motrix-git'
)
makedepends=(
    'p7zip'
)
depends=(
    'gtk3'
    'libxcb'
)
source=(
    'https://dl.motrix.app/release/Motrix-'${pkgver}'-x86_64.AppImage'
)
md5sums=(
    '96f2aea1332517fb645347d5033fbabf'
)

package() {
    7z x Motrix-${pkgver}-x86_64.AppImage -o${pkgdir}/opt/Motrix/

    chmod -R 755 ${pkgdir}/opt/

    for i in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024; do
        install -Dm644 ${pkgdir}/opt/Motrix/usr/share/icons/hicolor/$i/apps/motrix.png \
                       ${pkgdir}/usr/share/icons/hicolor/$i/apps/motrix.png
    done

    sed -i 's/Exec=AppRun/Exec=\/opt\/Motrix\/motrix/' ${pkgdir}/opt/Motrix/motrix.desktop

    install -Dm644 ${pkgdir}/opt/Motrix/motrix.desktop ${pkgdir}/usr/share/applications/motrix.desktop
    install -Dm644 ${pkgdir}/opt/Motrix/usr/share/mime/motrix.xml ${pkgdir}/usr/share/mime/application/motrix.xml

    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/Motrix/motrix ${pkgdir}/usr/bin/motrix

    rm ${pkgdir}/opt/Motrix/AppRun
    rm ${pkgdir}/opt/Motrix/motrix.png
    rm ${pkgdir}/opt/Motrix/motrix.desktop

    rm -r ${pkgdir}/opt/Motrix/usr/
}
