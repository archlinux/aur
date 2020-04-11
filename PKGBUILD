# Maintainer Alex Mcmillan <linuxguy93@gmail.com>

pkgname=linvst3-bin
pkgver=1.8
pkgrel=2
pkgdesc="enables Windows vst3's to be used as Linux vst's in Linux vst capable DAW's"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst3"
depends=('wine' 'freetype2' 'xcb-util' 'xcb-util-cursor' 'xcb-util-keysyms' 'libxkbcommon-x11' 'libx11' 'expat' 'gtkmm3' 'sqlite')
makedepends=('git')
conflicts=('linvst3')
replaces=('linvst3')
source=("https://github.com/osxmidi/LinVst3/releases/download/1.8/LinVst3-${pkgver}-Debian-Buster.zip"
        "git+https://github.com/usrmusicman/ArchStudioUtils.git")
sha256sums=('10cc5b4146b52f2b90f2b8de82115f92c8b03be050019a27b319c2249d61a5eb'
            'SKIP')

package() {
	cd "${srcdir}/LinVst3-${pkgver}-Debian-Buster/embedded/"
	for file in *.so; do
        	install -Dm755 $file $pkgdir/usr/bin/$file
	done
	for file in *.exe; do
		install -Dm755 $file $pkgdir/usr/bin/$file
	done
	install -Dm755 $srcdir/ArchStudioUtils/w2lvst3 $pkgdir/usr/bin/w2lvst3
}
