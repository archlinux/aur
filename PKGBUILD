# Maintainer Alex Mcmillan <linuxguy93@gmail.com>

pkgname=linvst2
pkgver=2.8
pkgrel=5
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine' 'python>=3.8')
makedepends=('git')
conflicts=('linvst' 'linvst-stable')
source=("https://github.com/osxmidi/LinVst/archive/${pkgver}.zip"
        "git+https://github.com/usrmusicman/ArchStudioUtils.git")
sha256sums=('c955a6fce5e4d8a6014dd2e7daed8ddca1f57ca9e394caf69f93c4f55b892a48'
            'SKIP')

build() {
	cd $srcdir/LinVst-${pkgver}
	make -f Makefile-embed-6432 DESTDIR="${pkgdir}" all 
}

package() {
	cd $srcdir/LinVst-${pkgver}
	make -f Makefile-embed-6432 DESTDIR="${pkgdir}" VST_DIR="${pkgdir}/usr/bin" install
	install -Dm755 $srcdir/ArchStudioUtils/w2lvst2 $pkgdir/usr/bin/w2lvst2
}
