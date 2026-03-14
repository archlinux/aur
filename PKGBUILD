# Maintainer: Erim <Erim4@yahoo.com>

pkgname=ape
pkgver=3.1.9
pkgrel=1
pkgdesc="A plasmid editor"
arch=('any')
url="https://jorgensen.biology.utah.edu/wayned/ape/"
license=('proprietary')
depends=('tclkit' 'sdx')
makedepends=('imagemagick')
source=("https://jorgensen.biology.utah.edu/wayned/ape/Download/Linux/ApE_linux_current.zip")
md5sums=('39d2de1d0056a29faf2b5ef2b0dcca0e')
b2sums=('c8d7d4a4e063e95a6a39005143cda1bd4fb2ab2791f4a2a90e0d525bf8d9aaf4d3cc5f0a9bef7d7d1168d5f93fe587ad9734ac1b77b1f51f7362e00c2de64687')
sha256sums=('729ddba56f93f0398a6b05a00611fad514c7859fdad4bf0b5e16655388d0b4f4')

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

