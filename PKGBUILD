# Maintainer: éclairevoyant
# Contributor: Chris Warrick <aur@chriswarrick.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
pkgname=pavumeter
pkgver=0.9.3
pkgrel=9
pkgdesc="A simple GTK volume meter for the PulseAudio sound server"
arch=('i686' 'x86_64')
url='http://0pointer.de/lennart/projects/pavumeter/'
license=('GPL')
depends=('gnome-icon-theme' 'gtkmm' 'libsigc++' 'pulseaudio')
makedepends=('git' 'lynx')
source=(git://git.0pointer.net/pavumeter.git
        $pkgname.desktop
        $pkgname-record.desktop)
sha256sums=('SKIP'
            '76c61e2991ac58d4158c51ab7829a8d09a301c1514e9ba6aa624dad9684a747e'
            '06fb8e2ac01f49fca112c05f4f5323ae521eafec72e734e65d9d0313b6f2c1ce')

build() {
	cd "$srcdir/$pkgname"
	./autogen.sh
	CXXFLAGS="$CXXFLAGS -std=c++11" ./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install

	cd "$srcdir"
	install -Dm644 -t "$pkgdir/usr/share/applications/" $pkgname.desktop $pkgname-record.desktop
}
