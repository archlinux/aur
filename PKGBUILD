# Maintainer: SanskritFritz (gmail)
# Contributor: Jason Melton <jason.melton@gmail.com>
# Contributor: Tiago Pierezan Camargo <tcamargo@gmail.com>
# Contributor: Paul Bredbury <brebs@sent.com>
# Contributor: Benjamin Dirks <asaru[at]wtnet[dot]de>

pkgname=worldofpadman-beta
pkgver=1.6.1
pkgrel=1
pkgdesc="Cartoon-style multiplayer first-person shooter"
arch=('x86_64')
url="http://www.worldofpadman.com/"
license=('GPL' 'custom')
depends=('curl' 'libogg' 'libvorbis' 'mesa' 'openal' 'sdl')
makedepends=('unzip')
conflicts=('worldofpadman')
source=('wop-161-beta-full-unified-zip::https://www.moddb.com/downloads/mirror/214409/119/3ad80876802e75e1c1ece98641f02b6b/?referer=https%3A%2F%2Fwww.moddb.com%2Fgames%2Fworld-of-padman%2Fdownloads%2Fwop-161-beta-full-unified-zip-windowslinuxmacos%2Fwidget'
        'worldofpadman.desktop')

_gamedir="/usr/share/$pkgname"

package() {

	cd "$srcdir/worldofpadman-1-6-1"

	## Binaries
	install -D -m755 wop-linux.x86_64 "$pkgdir/$_gamedir/wop.bin"
	install -D -m755 wopded-linux.x86_64 "$pkgdir/$_gamedir/wopded.bin"
	install -D -m755 renderer_opengl2_x86_64.so "$pkgdir/$_gamedir/renderer_opengl2_x86_64.so"
	install -D -m755 renderer_opengl1_x86_64.so "$pkgdir/$_gamedir/renderer_opengl1_x86_64.so"

	cat >wop.sh <<EOF
#!/bin/bash
cd $_gamedir && exec ./wop.bin "\$@"
EOF
  cat >wopded.sh <<EOF
#!/bin/bash
cd $_gamedir && exec ./wopded.bin "\$@"
EOF

	install -D -m755 wop.sh "$pkgdir/usr/bin/wop"
	install -D -m755 wopded.sh "$pkgdir/usr/bin/wopded"
  
	cp --recursive wop "$pkgdir/$_gamedir/wop"
	cp --recursive XTRAS "$pkgdir/$_gamedir/XTRAS"
	install -D -m755 XTRAS/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/worldofpadman.svg"
	install -D -m755 "$srcdir/worldofpadman.desktop" "$pkgdir/usr/share/applications/worldofpadman.desktop"
}

sha256sums=('c244134ff858602fb578cac1bb1f2303efca331f344f21663febed9d9b2db97b'
            '8d99702ee5255f5ea253aaf12d78f5056e0814bcc727ba2350021fb81fbad60b')
