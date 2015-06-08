# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=txtreader
pkgver=0.6.6
pkgrel=1
pkgdesc="This is a text reader,it's mainly used for reading text originally novels."
arch=('i686' 'x86_64')
url="http://code.google.com/p/txtreader4linux/"
license=('GPL')
depends=('qt4')
makedepends=('make')
source=("http://kde-apps.org/CONTENT/content-files/76994-txtreader-${pkgver}.zip")
sha1sums=('2f8ecc51d66c40daf01bac84131f68ed26c4e49e')

prepare() {
    cd "${srcdir}"
    _gen_dsk
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake-qt4 PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 {README_*.HTML,CHANGES.TXT} "${pkgdir}/usr/share/doc/${pkgname}/"
}

_gen_dsk() {
    cat > txtreader.desktop <<EOF
[Desktop Entry]
Name=Txt Reader
GenericName=Txt Reader
GenericName[zh_CN]=文本阅读器
Comment=Txt Reader for linux
Comment[zh_CN]=Txt Reader(文本阅读器) for linux
Exec=txtreader
Icon=txtreader.png
Terminal=0
Type=Application
Categories=Office;
MimeType=text/english;text/plain;text/chinese;
EOF
}
