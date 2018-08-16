# Maintainer: Pedro Silva <psilva+git@pedrosilva.pt>

pkgname=ape
pkgver=2.0.55
pkgrel=1
pkgdesc="A plasmid editor"
arch=('any')
url="http://biologylabs.utah.edu/jorgensen/wayned/ape/"
license=('proprietary')
depends=('tclkit' 'sdx')
makedepends=('imagemagick')
source=("http://biologylabs.utah.edu/jorgensen/wayned/ape/Download/WIndows/ApE_win_current.zip")
md5sums=('SKIP')

build() {
    rm -rf ApE_win_current.vfs
    sdx.kit unwrap ApE_win_current.exe
    convert -resize 48x48 "ApE_win_current.vfs/Accessory Files/Icons and images/monkey_icon.gif" "ape-48x48.png"
    convert "ApE_win_current.vfs/Accessory Files/Icons and images/monkey_icon.gif" "ape-128x128.png"
    cat <<EOF > ape
#!/bin/sh
tclkit-dyn /opt/ApE/main.tcl $@
EOF
    cat <<EOF > ApE.desktop
[Desktop Entry]
Name=ApE
GenericName=A Plasmid Editor
Comment=a tcl/tk plasmid editor
Exec=ape
Icon=/usr/share/icons/hicolor/128x128/apps/ape.png
Terminal=false
Type=Application
Categories=Education;Science;Biology;
EOF
}

package() {
    install -d "$pkgdir/opt"
    cp -r ApE_win_current.vfs  "$pkgdir/opt/ApE"
    install -m755 -D ape "$pkgdir/usr/bin/ape"
    install -m644 -D ApE.desktop "$pkgdir/usr/share/applications/ApE.desktop"
    install -m644 -D ape-48x48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/ape.png"
    install -m644 -D ape-128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/ape.png"
}
