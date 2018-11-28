# Maintainer: Michele Sorcinelli <michelesr@autistici.org>
pkgname=nvidia-xrun-pm
pkgver=20181128.db23415
pkgrel=1
epoch=
pkgdesc='Alternative version of nvidia-xrun, that relies on kernel PM instead of bbswitch'
arch=('x86_64')
url='https://github.com/michelesr/nvidia-xrun-pm'
license=('GPL')
groups=()
depends=('xorg-server' 'xorg-xinit' 'xorg-xrandr' 'nvidia' 'mesa-libgl')
makedepends=()
checkdepends=()
optdepends=()
provides=('nvidia-xrun')
conflicts=('nvidia-xrun')
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=("git://github.com/michelesr/$pkgname")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver () {
	cd ${pkgname}
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
	cd ${pkgname}
	install -Dm 644 nvidia-xorg.conf "$pkgdir/etc/X11/nvidia-xorg.conf"
	install -Dm 644 nvidia-xinitrc "$pkgdir/etc/X11/xinit/nvidia-xinitrc"
	install -Dm 755 nvidia-xrun "$pkgdir/usr/bin/nvidia-xrun"
	install -Dm 644 nvidia-xrun-pm.service "$pkgdir/etc/systemd/system/nvidia-xrun-pm.service"
	install -dm 555 "$pkgdir/etc/X11/xinit/nvidia-xinitrc.d"
	install -dm 555 "$pkgdir/etc/X11/nvidia-xorg.conf.d"
}
