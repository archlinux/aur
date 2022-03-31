# Maintainer: MGislv <mgislv at ceppo dot xyz>

pkgname=crispy-doom-git
pkgdesc='Limit-removing enhanced-resolution Doom source port based on Chocolate Doom'
pkgver=r7237.ae222fb9
pkgrel=1
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/fabiangreffrath/crispy-doom'
license=('GPL2')
depends=('hicolor-icon-theme' 'libpng' 'libsamplerate' 'sdl2_mixer' 'sdl2_net')
makedepends=('python' 'git')
optdepends=('freedm: Free deathmatch game'
            'freedoom: Free Doom compatible game')
provides=('crispy-doom')
conflicts=('crispy-doom')
install=crispy-doom.install
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd crispy-doom
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd crispy-doom
	autoreconf -fi
	./configure --prefix=/usr CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"
	make
}

package() {
	make DESTDIR="$pkgdir" -C crispy-doom install
	cd "$pkgdir/usr/share/man/man5"
	rm -f default.cfg.5 heretic.cfg.5 hexen.cfg.5
}
