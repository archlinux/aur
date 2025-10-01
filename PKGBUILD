# Maintainer: Erim <Erim4@yahoo.com>

pkgname=ape
pkgver=3.1.8.1
pkgrel=2
pkgdesc="A plasmid editor"
arch=('any')
url="https://jorgensen.biology.utah.edu/wayned/ape/"
license=('proprietary')
depends=('tclkit' 'sdx')
makedepends=('imagemagick')
source=("https://jorgensen.biology.utah.edu/wayned/ape/Download/Linux/ApE_linux_current.zip")
md5sums=('c2bb6143c15261d872d709fa1115a10c')

build() {
    cat <<EOF > ape
#!/bin/sh
tclkit-dyn /opt/ApE/ApE.tcl $@
EOF

    cat <<EOF > ApE.desktop
[Desktop Entry]
Name=ApE
GenericName=A Plasmid Editor
Comment=a tcl/tk plasmid editor
Exec=ape
Icon=/opt/ApE/Accessory Files/Icons and images/ApE_icon_200.png
Terminal=false
Type=Application
Categories=Education;Science;Biology;
EOF
}

package() {
    install -d "$pkgdir/opt"
    cp -r "./ApE Linux" "$pkgdir/opt/ApE"
    install -m755 -D ape "$pkgdir/usr/bin/ape"
#    install -m644 -D ape-48x48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/ape.png"
#    install -m644 -D ape-128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/ape.png"
    install -m644 -D ApE.desktop "$pkgdir/usr/share/applications/ApE.desktop"
}

