pkgname=linvst-stable
pkgver=2.4
pkgrel=1

_pkgname=LinVst

provides=('linvst')
conflicts=('linvst')

pkgdesc="Bridge that allows Windows vst's to be used as Linux vst's in Linux vst capable DAW's"
url="https://github.com/osxmidi/LinVst"
arch=('x86_64')
license=('GPL')

depends=('wine' 'gtk3')
makedepends=()

source=("https://github.com/osxmidi/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8d569804b5d0bbc305283d1f2d8ff7c04f9150bd7208a6d86feabbd17bdd34d7')


build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make -f Makefile-embed-6432 DESTDIR="${pkgdir}" all
	cd "convert"
	sh makegtk3
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make -f Makefile-embed-6432 DESTDIR="${pkgdir}" VST_DIR="${pkgdir}/usr/share/${_pkgname}"  install
	install -m 755 "convert/linvstconvert" "${pkgdir}/usr/bin/"
}
