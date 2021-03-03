# Maintainer: weearc <qby19981121@gmail.com>

pkgname=electron-markdownify
pkgver=git
pkgrel=1
pkgdesc="A minimal Markdown Editor desktop app built on top of Electron."
arch=('any')
url="https://github.com/amitmerchant1990/electron-markdownify"
license=('MIT')
depends=(
  'electron8'
)
makedepends=(
  'git'
  'yarn'
)
source=("${pkgname}::git+https://github.com/amitmerchant1990/electron-markdownify.git")
sha256sums=('SKIP')


prepare() {
    cd ${srcdir}/
    cd ${pkgname}/
    yarn
    mkdir build && cp app/img/markdownify.icns build/icon.icns
    cp app/img/markdownify.ico build/$pkgname.png
}

build(){
    cd ${srcdir}/${pkgname}
}


package() {
    install -d ${pkgdir}/opt
	install -d ${pkgdir}/usr/bin
	install -d ${pkgdir}/usr/lib
	install -d ${pkgdir}/usr/share/icons
	install -d ${pkgdir}/usr/share/applications
	
	echo "#!/bin/bash
electron8 /usr/lib/electron-markdownify/main.js \$@" > ${pkgdir}/usr/bin/$pkgname && chmod a+x ${pkgdir}/usr/bin/$pkgname


    echo "[Desktop Entry]
Name=Electron Markdownify
GenericName=Markdown Editor
Exec=${pkgname} %U
Icon=${pkgname}
Type=Application
StartupNotify=true
Categories=Office;WordProcessor;
MimeType=text/markdown;text/x-markdown;" > ${pkgdir}/usr/share/applications/${pkgname}.desktop

	cp -rf ${srcdir}/$pkgname ${pkgdir}/usr/lib/.
    

}
