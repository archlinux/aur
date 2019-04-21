pkgname=linvst-stable
pkgver=2.5
pkgrel=1
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
sha256sums=('e4c55be6239c55be864b8a88ffb6307588c05d9e0d477694227d521f0fb69816')


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
	install -m 755 "convert/pylinvstconvert" "${pkgdir}/usr/bin/"
}
