# Maintainer: Arthur Zamarin <arthurzam@gmail.com>
# Contributor: Ferik <djferik at gmail dot com>
# Contributor for Qt5 version: pavbaranov

pkgname=masterpdfeditor-qt5
pkgver=3.2.11
pkgrel=1
pkgdesc="A complete solution for creation and editing PDF files. (Free for non-commercial use) - Qt5 version"
url="http://code-industry.net/free-pdf-editor.php"
arch=('x86_64')
license=('custom')
depends=('qt5-base')
conflicts=('masterpdfeditor')
install=${pkgname}.install

source=(${pkgname}.desktop)
source_x86_64=(http://code-industry.net/public/master-pdf-editor-${pkgver}_qt5.amd64.tar.gz)

sha256sums=('29218c206e5b78776bc3ec44a760773273274bb56baee5e19e06c3ec55db59fd')
sha256sums_x86_64=('0a3d9c3ce3d753001bac2b59f227e455f4cd2ca6c83acd6d47472b708be4f6ed')

package() {
    mkdir -p "${pkgdir}/opt/masterpdfeditor"
    cd "${srcdir}/master-pdf-editor-3"
    /bin/tar cf - * | ( cd "${pkgdir}"/opt/masterpdfeditor; tar xfp - )
    install -D -m755 "${srcdir}"/master-pdf-editor-3/lang/*.qm "${pkgdir}"/opt/masterpdfeditor/lang
    install -D -m755 "${srcdir}"/master-pdf-editor-3/lang/*.ts "${pkgdir}"/opt/masterpdfeditor/lang
    install -D -m644 "${srcdir}"/master-pdf-editor-3/license.txt "${pkgdir}"/usr/share/licenses/masterpdfeditor/LICENSE
    install -D -m644 "${srcdir}"/master-pdf-editor-3/masterpdfeditor3.png "${pkgdir}"/usr/share/pixmaps/pdfeditor.png
    install -D -m644 "${srcdir}"/masterpdfeditor-qt5.desktop "${pkgdir}"/usr/share/applications/masterpdfeditor.desktop
    rm "${pkgdir}"/opt/masterpdfeditor/license.txt
    chmod 644 "${pkgdir}"/opt/masterpdfeditor/lang/*
    chmod 755 "${pkgdir}"/opt/masterpdfeditor/lang
    mkdir -p "${pkgdir}"/usr/bin
    ln -s /opt/masterpdfeditor/masterpdfeditor3 "${pkgdir}"/usr/bin/pdfeditor
}
