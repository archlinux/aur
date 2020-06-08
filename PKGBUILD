pkgname=sequoia-redactor
_pkgname=SequoiaRedactor
pkgver=1.5
pkgrel=1
pkgdesc="Text editor"
DESTDIR="${startdir}/${_pkgname}"
arch=('x86_64')
url="https://github.com/AlexVIM1/sequoia"
license=('GPLv3')
depends=('qt5-base')
checkdepends=()
install=
changelog=
source=("https://raw.githubusercontent.com/AlexVIM1/sequoia/master/${_pkgname}-${pkgver}-${arch}.tar.gz")
md5sums=('d3658a13b09e2dd4f107fb84e2a27513')
build() {
    cd ${srcdir}/build/src
    qmake
    make
}
package() {
    cd ${srcdir}/build/src
	make INSTALL_ROOT="$pkgdir" install
	install -d "${pkgdir}/usr/share/${pkgname}"
	cp -a . "${pkgdir}/usr/share/${pkgname}"
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	install -Dm755 SequoiaRedactor "${pkgdir}/usr/bin"
	install -Dm755 ../res/sequoia-icon.png "${pkgdir}/usr/share/pixmaps"
	install -Dm755 sequoia-redactor.desktop "${pkgdir}/usr/share/applications"
}
