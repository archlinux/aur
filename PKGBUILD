# Maintainer Alex Mcmillan <linuxguy93@gmail.com>

pkgname=linvst3x-bin
pkgver=1.7
pkgrel=1
pkgdesc="enables Windows vst3's to be used as Linux vst's in Linux vst capable DAW's (single wineserver instance variant)"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst3"
depends=('wine' 'freetype2' 'xcb-util' 'xcb-util-cursor' 'xcb-util-keysyms' 'libxkbcommon-x11' 'libx11' 'expat' 'gtkmm3' 'sqlite')
makedepends=('git')
conflicts=('linvst3x')
source=("https://github.com/osxmidi/LinVst3-X/releases/download/1.7/LinVst3-X-${pkgver}-Manjaro.zip"
        "git+https://github.com/usrmusicman/ArchStudioUtils.git")
sha256sums=('b209d32bfe3c89f5fda545ebbdb868d51ad74245c6fba5805aac2cbc8ae20253'
            'SKIP')

package() {
	cd "${srcdir}/LinVst3-X-${pkgver}-Manjaro/embedded/"
	for file in *.so; do
        	install -Dm755 $file $pkgdir/usr/bin/$file
	done
	for file in *.exe; do
		install -Dm755 $file $pkgdir/usr/bin/$file
	done
	install -Dm755 $srcdir/ArchStudioUtils/w2lvst3_X $pkgdir/usr/bin/w2lvst3_X
}
