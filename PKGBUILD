# Maintainer: robus <RobusGrobus95@gmail.com>
_pkgname=nvidia-xrun
pkgname=$_pkgname"-git"
pkgver=0.3.79.gaf3b734
pkgrel=1
epoch=
pkgdesc="Script to run dedicated X server with discrete nvidia graphics (git version)"
arch=("x86_64")
url="https://github.com/Witko/nvidia-xrun"
license=('GPL')
groups=()
depends=('xorg-server' 'xorg-xinit' 'xorg-xrandr' 'nvidia' 'mesa')
makedepends=('git')
checkdepends=()
optdepends=()
provides=("$_pkgname=$pkgver" "$pkgname=$pkgver")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/Witko/$_pkgname.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --tags | sed "s/-/./g"
}

package() {
	cd "$_pkgname"
	install -Dm 644 nvidia-xrun-pm.service "$pkgdir/etc/systemd/system/nvidia-xrun-pm.service"
	install -Dm 644 config/nvidia-xrun "$pkgdir/etc/default/nvidia-xrun"
	install -Dm 644 nvidia-xorg.conf "$pkgdir/etc/X11/nvidia-xorg.conf"
	install -Dm 644 nvidia-xinitrc "$pkgdir/etc/X11/xinit/nvidia-xinitrc"
	install -Dm 755 nvidia-xrun "$pkgdir/usr/bin/nvidia-xrun"
	install -dm 555 "$pkgdir/etc/X11/xinit/nvidia-xinitrc.d"
	install -dm 555 "$pkgdir/etc/X11/nvidia-xorg.conf.d"
}

