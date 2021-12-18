# Maintainer: SanskritFritz (gmail)
# Contributor: Jason Melton <jason.melton@gmail.com>
# Contributor: Tiago Pierezan Camargo <tcamargo@gmail.com>
# Contributor: Paul Bredbury <brebs@sent.com>
# Contributor: Benjamin Dirks <asaru[at]wtnet[dot]de>

pkgname=worldofpadman
pkgver=1.6.2
pkgrel=1
pkgdesc="Cartoon-style multiplayer first-person shooter"
arch=('x86_64')
url="https://worldofpadman.net/en/"
license=('GPL' 'custom')
depends=('curl' 'libogg' 'libvorbis' 'mesa' 'openal' 'sdl')
makedepends=('unzip')
source=('wop-162-full-unified-zip::https://www.moddb.com/downloads/mirror/224119/124/c8b8bcc423fdfe661e190f8fbf433bad'
        'worldofpadman.desktop')

_gamedir="/usr/share/$pkgname"

package() {
	cd "$srcdir/worldofpadman-1-6-2"

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
	install -D -m755 XTRAS/wop.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/wop.svg"
	install -D -m755 "$srcdir/worldofpadman.desktop" "$pkgdir/usr/share/applications/worldofpadman.desktop"
}

sha256sums=('526d5936225b37fa8a5b94a7c02dc600126d1f2fb1155fd0e372c36075344335'
            '8d99702ee5255f5ea253aaf12d78f5056e0814bcc727ba2350021fb81fbad60b')
