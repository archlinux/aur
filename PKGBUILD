pkgname=linvst-stable
pkgver=2.4
pkgrel=2
provides=('linvst')
conflicts=('linvst')
pkgdesc="Bridge that allows Windows vst's to be used as Linux vst's in Linux vst capable DAW's"
url="https://github.com/osxmidi/LinVst"
arch=('x86_64')
license=('GPL')
depends=('wine' 'gtk3')
makedepends=()
install="linvst-stable.install"

_pkgname=LinVst

source=("https://github.com/osxmidi/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8d569804b5d0bbc305283d1f2d8ff7c04f9150bd7208a6d86feabbd17bdd34d7')


build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make -f Makefile-embed-6432 DESTDIR="${pkgdir}" all
	cd "convert"
	bash makegtk3
	bash makegtk3tree
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make -f Makefile-embed-6432 DESTDIR="${pkgdir}" VST_DIR="${pkgdir}/usr/share/linvst"  install
	install -m 755 "convert/linvstconvert" "${pkgdir}/usr/bin/"
	install -m 755 "convert/linvstconverttree" "${pkgdir}/usr/bin/"
}
