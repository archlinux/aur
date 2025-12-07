# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Previous maintainer: Daniel Apolinario <dapolinario@gmail.com>
# Contributor: Roman Timushev <romikt@gmail.com>
pkgname=gnome-defaults-list
pkgver=49.2
pkgrel=1
pkgdesc="Default file associations for GNOME environment"
url="https://tracker.debian.org/pkg/gnome-session"
arch=(any)
license=(GPL LGPL)
source=("https://deb.debian.org/debian/pool/main/g/gnome-session/gnome-session_${pkgver}-${pkgrel}.debian.tar.xz")
# Old Ubuntu source
#_ubuntuver=0ubuntu5
#source=(http://archive.ubuntu.com/ubuntu/pool/main/g/gnome-session/gnome-session_${pkgver}-${_ubuntuver}.debian.tar.xz)
sha256sums=('28e76b08be7624e653dbf00a045fdf3ce491b7eb72cc769c71961fe110067b9f')
makedeps=('python3')

build() {
	echo "-> Generating the mimelist..."
	cd "$srcdir/debian"
	python3 gnome-mimeapps/build-mimeapps.py mimeapps/debian.conf gnome-mimeapps.list
}

package() {
	install -d "$pkgdir/usr/share/applications"
	cp "$srcdir/debian/gnome-mimeapps.list" "$pkgdir/usr/share/applications/"
}
