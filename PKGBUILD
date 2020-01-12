# Maintainer Alex Mcmillan <linuxguy93@gmail.com>

pkgname=linvst2
pkgver=2.8
pkgrel=1
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine' 'python>=3.8')
conflicts=('linvst' 'linvst-stable')
replaces=('linvst' 'linvst-stable')
source=("$pkgname::git+https://github.com/osxmidi/LinVst.git#tag=$pkgver"
        "git+https://github.com/usrmusicman/ArchStudioUtils.git")
sha256sums=('SKIP'
            'SKIP')

build() {
	cd $srcdir/$pkgname
	make -f Makefile-embed-6432 DESTDIR="${pkgdir}" all 
}

package() {
	cd $srcdir/$pkgname
	make -f Makefile-embed-6432 DESTDIR="${pkgdir}" VST_DIR="${pkgdir}/usr/bin" install
	install -Dm755 $srcdir/ArchStudioUtils/w2lvst2 $pkgdir/usr/bin/w2lvst2
}
