# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>
# Original PKGBUILD by: berkus [berkus_at_madfire_dot_net]

pkgname=ocp
pkgver=0.2.1
pkgrel=1
pkgdesc="Open Cubic Player"
arch=('i686' 'x86_64')
url="https://github.com/mywave82/opencubicplayer"
depends=('libsidplay' 'libxxf86vm' 'libvorbis' 'libxpm' 'alsa-lib' 'libmad' 'flac' 'sdl' 'adplug')
makedepends=('desktop-file-utils')
license=('GPL')
source=(git+https://github.com/mywave82/opencubicplayer.git#tag=v${pkgver}
        git+https://github.com/mywave82/timidity.git)
md5sums=('SKIP'
         'SKIP')

prepare() {
	cd opencubicplayer
	git submodule init
	git config submodule.playgmi/timidity-git.url $srcdir/timidity
	git submodule update
}

build() {
	cd opencubicplayer
	./configure --prefix=/usr --sysconfdir=/etc
	make DESTDIR=$pkgdir
}

package() {
	cd opencubicplayer
	make DESTDIR=$pkgdir install
}
