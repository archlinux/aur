# Maintainer: silverhikari
pkgname=openhsp-git
pkgver=v3.6.r3.0e0c213
pkgrel=1
pkgdesc="Hot Soup Processor version 3 Compiler"
arch=(x86_64)
url="https://github.com/onitama/OpenHSP"
license=('BSD')
depends=('glew' 'sdl2' 'mesa' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'gtk2')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('openhsp::git+https://github.com/onitama/OpenHSP.git' 'hsed.desktop' 'application-hot-soup-processor.xml')
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
cd "$srcdir/${pkgname%-git}"

    mkdir -p "${pkgdir}/usr/local/share/applications/"
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/local/share/fonts/"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname-git}/"
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname-git}/"
    mkdir -p "${pkgdir}/usr/share/mime/packages"

    install "${srcdir}/hsed.desktop" -t "${pkgdir}/usr/local/share/applications/"
    install "./hsed.png" -t "${pkgdir}/usr/share/pixmaps/"
    install -m444 "./ipaexg.ttf" -t "${pkgdir}/usr/local/share/fonts/"
    install "./hsed" "./hsp3cl" "./hsp3dish" "./hsp3gp" "./hspcmp" -t "${pkgdir}/usr/bin/"
    install -m644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname-git}/"
    install -dm777 "./doclib_en" "${pkgdir}/usr/share/doc/${pkgname-git}/"
    install -m777 "./index_en.htm" "./main.css" "./single.css" -t "${pkgdir}/usr/share/doc/${pkgname-git}/"
    install "${srcdir}/application-hot-soup-processor.xml" -t "${pkgdir}/usr/share/mime/packages"
}
