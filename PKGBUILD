# Maintainer: Drew Reed <reed dot 995 at osu dot edu>

pkgname=modloader64-gui-bin
pkgver=1.1.60
pkgrel=1
pkgdesc="Successor to OotModLoader. It is designed to provide memory access, rom patching, and multiplayer networking in an easy to use framework."
arch=('x86_64')
url="https://github.com/hylian-modding/ModLoader64-GUI"
license=('GPL3')
depends=('nodejs' 'glew-2.1' 'sdl2_ttf' 'sdl2_image' 'sfml' 'mpg123' 'nss' 'libxss' 'gtk3')
makedepends=('npm' 'git')
source=("https://github.com/hylian-modding/ModLoader64-GUI/releases/download/v${pkgver}/modloader64-gui-${pkgver}.tar.gz"
	'git+https://github.com/hylian-modding/node-addon-sfml-audio.git'
	'modloader64-gui.sh')

md5sums=('0a54afa7c624e03887553e77eb9172aa'
         'SKIP'
         '2be2b992d95048fb4737e37dae4a442d')

build() {
	cd "node-addon-sfml-audio"
	npm install typescript
	npm install
}

package() {
        install -Dm 755 $srcdir/modloader64-gui.sh $pkgdir/usr/bin/modloader64-gui
        install -D $srcdir/node-addon-sfml-audio/build/Release/sfml_audio.node $pkgdir/opt/modloader64-gui/sfml_audio.node
        cp -r modloader64-gui-$pkgver/* $pkgdir/opt/modloader64-gui/
}
