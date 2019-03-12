# Maintainer: N.E. Neal <contact at [part of name before neal without dots] dog com>
pkgname=nvidia-xrun-pm-git
pkgver=r61.017c83b
pkgrel=1
epoch=
pkgdesc='Alternative version of nvidia-xrun, that relies on kernel PM instead of bbswitch - git branch'
arch=('x86_64')
url='https://github.com/michelesr/nvidia-xrun-pm'
license=('GPL')
groups=()
depends=('xorg-server' 'xorg-xinit' 'xorg-xrandr' 'nvidia' 'mesa-libgl' 'xf86-video-intel')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('nvidia-xrun' 'nvidia-xrun-pm')
conflicts=('nvidia-xrun')
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=("$pkgname::git+https://github.com/michelesr/nvidia-xrun-pm")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver () {
	cd $pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $pkgname
	install -Dm 644 nvidia-xorg.conf "$pkgdir/etc/X11/nvidia-xorg.conf"
	install -Dm 644 nvidia-xinitrc "$pkgdir/etc/X11/xinit/nvidia-xinitrc"
	install -Dm 755 nvidia-xrun "$pkgdir/usr/bin/nvidia-xrun"
	install -Dm 644 nvidia-xrun-pm.service "$pkgdir/etc/systemd/system/nvidia-xrun-pm.service"
	install -dm 555 "$pkgdir/etc/X11/xinit/nvidia-xinitrc.d"
	install -dm 555 "$pkgdir/etc/X11/nvidia-xorg.conf.d"
}

