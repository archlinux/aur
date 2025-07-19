# Maintainer: MediaArea.net SARL <info@mediaarea.net>
# This AUR package was built from: https://github.com/MediaArea/BWFMetaEdit/blob/master/Project/GNU/PKGBUILD 
# And modified to work by pulling from GitHub
# Maintainer: Frederick Price <fprice@pricemail.ca>

pkgname=('bwfmetaedit' 'bwfmetaedit-gui')
pkgver=25.04
pkgrel=1
pkgdesc="Supplies technical and tag information about a video or audio file"
url="http://mediaarea.net"
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MediaArea/BWFMetaEdit/archive/v$pkgver.tar.gz")
md5sums=('682edde44eb8ffa3e8578e762bf78421')
arch=('i686' 'x86_64')
makedepends=('qt5-base' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-tools' 'ca-certificates')

prepare() {

    cd "$srcdir/BWFMetaEdit-$pkgver"/Project/GNU/CLI

    sh ./autogen
    ./configure --prefix=/usr

    cd "$srcdir/BWFMetaEdit-$pkgver"/Project/QtCreator
    sh ./prepare BINDIR=/usr/bin
}

build() {
    cd "$srcdir/BWFMetaEdit-$pkgver"/Project/GNU/CLI
    make

    cd "$srcdir/BWFMetaEdit-$pkgver"/Project/QtCreator
    make
}

package_bwfmetaedit() {
    pkgdesc="${pkgdesc} (CLI)"

    cd "$srcdir/BWFMetaEdit-$pkgver"/Project/GNU/CLI
    make DESTDIR="${pkgdir}" install

    install -D -m 0644 "$srcdir/BWFMetaEdit-$pkgver"/License.html "${pkgdir}"/usr/share/licenses/${pkgname}/License.html
    install -D -m 0644 "$srcdir/BWFMetaEdit-$pkgver"/History_CLI.txt "${pkgdir}"/usr/share/doc/${pkgname}/History.txt
    install -D -m 0644 "$srcdir/BWFMetaEdit-$pkgver"/Release/ReadMe_CLI_Linux.txt "${pkgdir}"/usr/share/doc/${pkgname}/ReadMe.txt
    install -D -m 0644 "$srcdir/BWFMetaEdit-$pkgver"/conformance_point_document.xsd "${pkgdir}"/usr/share/doc/${pkgname}/conformance_point_document.xsd
}

package_bwfmetaedit-gui() {
    pkgdesc="${pkgdesc} (GUI)"
    depends=('qt5-base' 'qt5-quickcontrols2' 'qt5-svg')

    cd "$srcdir/BWFMetaEdit-$pkgver"/Project/QtCreator
    make INSTALL_ROOT="${pkgdir}" install

    install -D -m 0644 "$srcdir/BWFMetaEdit-$pkgver"/License.html "${pkgdir}"/usr/share/licenses/${pkgname}/License.html
    install -D -m 0644 "$srcdir/BWFMetaEdit-$pkgver"/History_GUI.txt "${pkgdir}"/usr/share/doc/${pkgname}/History.txt
    install -D -m 0644 "$srcdir/BWFMetaEdit-$pkgver"/Release/ReadMe_GUI_Linux.txt "${pkgdir}"/usr/share/doc/${pkgname}/ReadMe.txt
    install -D -m 0644 "$srcdir/BWFMetaEdit-$pkgver"/conformance_point_document.xsd "${pkgdir}"/usr/share/doc/${pkgname}/conformance_point_document.xsd

    install -D -m 0644 "$srcdir/BWFMetaEdit-$pkgver"/Source/Resource/Image/Logo/Logo128.png "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/bwfmetaedit-gui.png
    install -D -m 0644 "$srcdir/BWFMetaEdit-$pkgver"/Source/Resource/Image/Logo/Logo128.png "${pkgdir}"/usr/share/pixmaps/bwfmetaedit-gui.png
    install -D -m 0644 "$srcdir/BWFMetaEdit-$pkgver"/Project/GNU/GUI/bwfmetaedit-gui.desktop "${pkgdir}"/usr/share/applications/bwfmetaedit-gui.desktop
    install -D -m 0644 "$srcdir/BWFMetaEdit-$pkgver"/Project/GNU/GUI/bwfmetaedit-gui.metainfo.xml "${pkgdir}"/usr/share/metainfo/bwfmetaedit-gui.metainfo.xml
    install -D -m 0644 "$srcdir/BWFMetaEdit-$pkgver"/Project/GNU/GUI/bwfmetaedit-gui.kde3.desktop "${pkgdir}"/usr/share/apps/konqueror/servicemenus/bwfmetaedit-gui.desktop
    install -D -m 0644 "$srcdir/BWFMetaEdit-$pkgver"/Project/GNU/GUI/bwfmetaedit-gui.kde4.desktop "${pkgdir}"/usr/share/kde4/services/ServiceMenus/bwfmetaedit-gui.desktop
    install -D -m 0644 "$srcdir/BWFMetaEdit-$pkgver"/Project/GNU/GUI/bwfmetaedit-gui.kde4.desktop "${pkgdir}"/usr/share/kservices5/ServiceMenus/bwfmetaedit-gui.desktop
}
