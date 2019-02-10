# Maintainer: AUTplayed <fips.hem@gmail.com>
# Contributor: pavanjadhaw <pavanjadhaw96@gmail.com>
_pkgname=betterlockscreen
pkgname=${_pkgname}-git
pkgver=r98.d877b69
pkgrel=1
pkgdesc="A simple lock script for i3lock-color"
arch=('any')
url="https://github.com/pavanjadhaw/${_pkgname}"
license=('MIT')
depends=('i3lock-color' 'imagemagick' 'xorg-xrandr' 'xorg-xdpyinfo' 'bc')
optdepends=('feh: Allows setting wallpaper')
conflicts=("betterlockscreen")
source=("${_pkgname}::git+${url}.git")
md5sums=("SKIP")
install=${_pkgname}.install

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	_srcdir="$srcdir/$_pkgname"
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	if [[ $(pidof systemd) ]]; then
		_serviceloc="$pkgdir/lib/systemd/system"
		mkdir -p "$_serviceloc"
		_servicename="$_pkgname@.service"
		cp "$_srcdir/system/$_servicename" "$_serviceloc/$_servicename"
	fi
	mkdir -p "$pkgdir/usr/share/doc/$_pkgname/examples"
	cp "$_srcdir/examples/${_pkgname}rc" "$pkgdir/usr/share/doc/$_pkgname/examples/${_pkgname}rc"	

}
