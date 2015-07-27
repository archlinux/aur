# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=pavucontrol
pkgname=$_pkgname-git
pkgver=3.0.4.g290485e
pkgrel=1
pkgdesc="A GTK volume control for PulseAudio"
arch=("i686" "x86_64")
url="http://freedesktop.org/software/pulseaudio/pavucontrol/"
license=("GPL")
depends=("pulseaudio" "gtkmm3" "libcanberra-pulse")
makedepends=("git" "intltool" "lynx")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git://anongit.freedesktop.org/pulseaudio/pavucontrol")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed 's/^v//;s/-/./g'
}

build() {
	cd "$_pkgname"
        ./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir" install
}
