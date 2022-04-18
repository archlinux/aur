# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=pavucontrol
pkgname=$_pkgname-compact-git
pkgver=33bc9f4
pkgrel=1
pkgdesc="A GTK volume control for PulseAudio. Compact fork."
arch=("i686" "x86_64")
url="http://freedesktop.org/software/pulseaudio/pavucontrol/"
license=("GPL")
depends=("gtkmm3" "libcanberra-pulse")
optdepends=("pulseaudio")
makedepends=("git" "intltool" "lynx")
provides=("$_pkgname" "$_pkgname-git" "$pkgname")
conflicts=("$_pkgname" "$_pkgname-git" "$pkgname")
source=("git+https://github.com/rafalcieslak/pavucontrol.git")
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
