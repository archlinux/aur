# Maintainer: Jeff M. Hubbard <jeffmhubbard@gmail.com>
_pkgname=mpnotd
pkgname=${_pkgname}-git
pkgver=r4.613c1f4
pkgrel=1
pkgdesc="MPD Notification Daemon"
arch=('any')
url="https://github.com/jeffmhubbard/mpnotd"
license=('MIT')
depends=('mpd' 'python' 'python-mpd2' 'python-notify2' 'python-beautifulsoup4')
makedepends=('git' 'sed' 'grep')
optdepends=('dunst: Display notifications')
conflicts=()
source=("${_pkgname}::git+${url}.git")
md5sums=("SKIP")
install=${_pkgname}.install

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir -p $pkgdir/usr/bin
	cp "$srcdir/$_pkgname/$_pkgname" $pkgdir/usr/bin/$_pkgname
	if [[ $(pidof systemd) ]]; then
		_serviceloc="$pkgdir/usr/lib/systemd/user"
		mkdir -p "$_serviceloc"
		_servicename="$_pkgname.service"
		cp "$srcdir/$_pkgname/$_servicename" "$_serviceloc/$_servicename"
	fi
}
