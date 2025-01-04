# Maintainer: ZAvrikDinozavrik <zaz965@stm32f0.ru>
pkgname=sonycardscanner
pkgver=0.0.3
pkgrel=1
pkgdesc="Утилита для работы с камерами Sony"
arch=('x86_64')
url="https://git.alexavr.ru/ZAvrikDinozavrik/SonyCardScanner"
license=('GPL3')
depends=('qt5-base' 'libraw' 'opencv')
source=("sonycardscanner-$pkgver-linux.tar.gz::https://git.alexavr.ru/ZAvrikDinozavrik/SonyCardScanner/archive/v$pkgver.tar.gz")
b2sums=('SKIP')

build() {
    cd $srcdir/sonycardscanner
    qmake
    make
}

package() {
    cd $srcdir/sonycardscanner
    make INSTALL_ROOT="$pkgdir" install
    install -d "${pkgdir}/usr/share/icons/"
    cp icons/icon.svg ${pkgdir}/usr/share/icons/SonyCardScanner.svg
    install -d "${pkgdir}/usr/share/applications/"
    cat > ${pkgdir}/usr/share/applications/SonyCardScanner.desktop << EOF
#!/usr/bin/env xdg-open
[Desktop Entry]
Version=$pkgver
Type=Application
Terminal=false
Name=SonyCardScanner
Exec=/usr/bin/SonyCardScanner -g
Comment=Утилита для работы с камерами Sony
Icon=/usr/share/icons/SonyCardScanner.svg
StartupNotify=false
Encoding=UTF-8
Categories=Multimedia;Graphics;
EOF
}
