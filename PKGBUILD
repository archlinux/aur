# Maintainer: Rafal Malachowicz <k5hv@linux.pl>
pkgname=vcmi-demo
pkgver=1.0
pkgrel=1
pkgdesc="Files extraced from Heroes of Might and Magic III Demo"
arch=("any")
license=('unknown')
depends=('vcmi')
makedepends=('unarchiver')
source=("http://download.fileplanet.com/ftp1/fpnew/gamedemos/strategy/heroes_3_complete_demo.sit")
sha512sums=('9597f6ac72cca66362cdaeadab9d459c007cd260754f030eb4d4a084d80de32fe927fa68ad58b48826afea29d54463f665ce5ed7e0e0db3cf7e34cd8b572933a')

build() {
    # We'll unpack only needed files
	unar -f -t heroes_3_complete_demo.sit "*/data/*.lod" "*/data/*.snd" "*/data/*.vid" "*/maps/*" "*/music/*"

    # rsrc files are Mac related metafiles. Let's delete them
    find ./Heroes\ III\ Demo -name "*.rsrc" -delete
}

package() {
    # We'll copy files to system shared data directory. User can still copy homm3 data to home directory to enjoy full game
	mkdir -p $pkgdir/usr/share/vcmi
    cp -r Heroes\ III\ Demo/* $pkgdir/usr/share/vcmi
}
