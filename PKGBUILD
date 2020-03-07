# Maintainer Alex Mcmillan <linuxguy93@gmail.com>

pkgname=linvst2x
pkgver=2.7
pkgrel=3
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's (single wineserver instance variant)"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine' 'python>=3.8')
makedepends=('git')
conflicts=('linvst' 'linvst-stable')
source=("https://github.com/osxmidi/LinVst-X/archive/${pkgver}.tar.gz"
        "git+https://github.com/usrmusicman/ArchStudioUtils.git")
sha256sums=('319f1518f3a868d963850d7eb6d259a955284b8348035484bea030616b2fe116'
            'SKIP')

build() {
	cd $srcdir/LinVst-X-${pkgver}
	make DESTDIR="${pkgdir}" all 
}

package() {
	cd $srcdir/LinVst-X-${pkgver}
	make DESTDIR="${pkgdir}" VST_DIR="${pkgdir}/usr/bin" install
	install -Dm755 $srcdir/ArchStudioUtils/w2lvst2_X $pkgdir/usr/bin/w2lvst2_X
}
