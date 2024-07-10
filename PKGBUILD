# Maintainer: Yauheni Kirylau <actionless dot loveless AT gmail MF com>
pkgname=vst-preset-generator
_reponame=vpg
pkgver=0.3.0
pkgrel=1
pkgdesc="GUI tool for generating VST presets in FXP/FXB formats"
arch=('x86_64')
url="https://vst-preset-generator.org/"
license=('GPLv2')
depends=(qt5-base)
makedepends=(gcc cmake vst2sdk )
optdepends=('asciidoctor-pdf: generate-docs')
source=(
${_reponame}.tar.gz::https://download.tuxfamily.org/vpg/$pkgver/vpg-$pkgver-src.tar.gz
)
sha256sums=('8bd4970d154ef73722d29e02de6b5827754efcc97a9d651e948aaf60d1114601')


build(){
	cd $srcdir/$_reponame/vst-preset-gen.r113
	qmake -makefile src/vpg.pro
	make
	if which asciidoctor-pdf ; then
		asciidoctor -r asciidoctor-pdf -b pdf -o vpg-doc.pdf ./doc/vpg.asciidoc
	fi
}

package(){
	cd $srcdir/$_reponame/vst-preset-gen.r113
	install -Dm755 vpg -t $pkgdir/usr/bin/
	if test -f vpg-doc.pdf ; then
		install -Dm755 vpg-doc.pdf -t $pkgdir/usr/share/doc/$pkgname
	fi
	install -Dm755 LICENSE -t $pkgdir/usr/share/doc/$pkgname
	install -Dm644 build/package/vst-preset-generator.desktop \
		"$pkgdir/usr/share/applications/vst-preset-generator.desktop"
	install -Dm644 build/package/vpg_128x128.png \
		"$pkgdir"/usr/share/icons/hicolor/scalable/apps/vpg.png
	install -Dm644 build/package/vpg_128x128.png \
		"$pkgdir"/usr/share/icons/hicolor/128x128/apps/vpg.png
	install -Dm644 build/package/vpg_48x48.png \
		"$pkgdir"/usr/share/icons/hicolor/48x48/apps/vpg.png
	install -Dm644 build/package/vpg_32x32.png \
		"$pkgdir"/usr/share/icons/hicolor/32x32/apps/vpg.png
}
