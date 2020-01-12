# Maintainer Alex Mcmillan <linuxguy93@gmail.com>

pkgname=linvst2x
pkgver=2.7
pkgrel=1
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's (single wineserver instance variant)"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine' 'python>=3.8')
conflicts=('linvst' 'linvst-stable' 'linvst2')
source=("$pkgname::git+https://github.com/osxmidi/LinVst-X.git#tag=$pkgver"
        "git+https://github.com/usrmusicman/ArchStudioUtils.git")
sha256sums=('SKIP'
            'SKIP')

build() {
	cd $srcdir/$pkgname
	make DESTDIR="${pkgdir}" all 
}

package() {
	cd $srcdir/$pkgname
	make DESTDIR="${pkgdir}" VST_DIR="${pkgdir}/usr/bin" install
	install -Dm755 $srcdir/ArchStudioUtils/w2lvst2_X $pkgdir/usr/bin/w2lvst2_X
}
