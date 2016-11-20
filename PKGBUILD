# Based on the splitted packkage: https://aur.archlinux.org/packages/pasystray-gtk2/
# Maintainer: joel <aullidolunar at gmai1 d0t c0m>

_pkgname=pasystray
pkgname=${_pkgname}-gtk3-standalone
pkgver=0.6.0
pkgrel=1
pkgdesc="PulseAudio system tray (a replacement for padevchooser gtk3 standalone version)"
arch=('i686' 'x86_64')
url="https://github.com/christophgysin/pasystray"
license=('LGPL')
groups=('multimedia')
provides=(${_pkgname})
conflicts=(${_pkgname})
replace=(${_pkgname})
makedepends=('git')
depends=('gtk3' 'libpulse' 'libnotify' 'avahi' 'libx11' 'gnome-icon-theme' 'gtk-update-icon-cache')
optdepends=(
    'pulseaudio: To control a local pulseaudio instance'
    'paman: Launch PulseAudio manager from tray icon'
    'pavucontrol: Launch PulseAudio mixer from tray icon'
    'pavumeter: Launch PulseAudio volume meter from tray icon'
    'paprefs: Launch PulseAudio preferences from tray icon'
)
source=($_pkgname-$pkgver.tar.gz::https://github.com/christophgysin/$_pkgname/archive/$pkgver.tar.gz)
md5sums=('c7467ac2b75290bd086fc60f8243ad77')

prepare () {
	cd "$srcdir/${_pkgname}-$pkgver"
	autoreconf -is
	sed -i -e '/<requires /d' -e '/license_type/d' src/pasystray.glade
}

build () {
	cd "$srcdir/${_pkgname}-$pkgver"
	# Do you need appindicator in gtk3?
	./configure --prefix=/usr --with-gtk=3 --disable-appindicator
}

package () {
    cd "$srcdir/${_pkgname}-$pkgver"
    make DESTDIR="$pkgdir/" install
}
