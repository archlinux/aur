# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
pkgname=gaffer-bin
pkgver=1.4.13.0
pkgrel=1
pkgdesc="Gaffer is a VFX application that enables look developers, lighters, and compositors to easily build, tweak, iterate, and render scenes."
arch=('any')
url="https://www.gafferhq.org/"
license=('BSD-3-Clause')
depends=('python')
provides=('gaffer')
source=(https://github.com/GafferHQ/gaffer/releases/download/$pkgver/gaffer-$pkgver-linux-gcc11.tar.gz)
noextract=("$provides-$pkgver-linux-gcc11.tar.gz")
md5sums=('1da55dc8647773c9537dd4ceabaa94fd')
options=('!strip')

prepare() {
	bsdtar xf "$provides-$pkgver-linux-gcc11.tar.gz"
}

package() {
	mkdir -p "${pkgdir}/opt"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/icons"
	mkdir -p "${pkgdir}/usr/share/mime/application"
	mkdir -p "${pkgdir}/usr/share/applications"

	mv "$provides-$pkgver-linux-gcc11" "${pkgdir}/opt/gaffer"

	cp "$srcdir/../gaffer.desktop" "${pkgdir}/usr/share/applications/"
	cp "$srcdir/../x-gaffer.xml" "${pkgdir}/usr/share/mime/application/"

	ln -s "/opt/gaffer/graphics/GafferLogoMini.png" "${pkgdir}/usr/share/icons/gafferhq.png"

	ln -s "/opt/gaffer/bin/gaffer" "${pkgdir}/usr/bin/"

}
