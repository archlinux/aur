# Maintainer: Ricardo Vieira <ricardo.vieira@tecnico.ulisboa.pt>

pkgname=budgie-desktop-git
pkgver=v10.2.9.r26.g7071987
pkgrel=1
pkgdesc="Simple GTK3 desktop experience"
arch=('i686' 'x86_64')
url="https://solus-project.com/budgie"
license=('GPLv2')
depends=('gnome-bluetooth' 'gnome-menus' 'gnome-session' 'gnome-themes-standard' 'libpeas' 'libwnck3'
         'mutter' 'accountsservice' 'gnome-desktop' 'libpulse')
makedepends=('autoconf' 'git' 'gobject-introspection' 'intltool' 'vala' 'gtk-doc')
optdepends=('gnome-backgrounds: Default background'
            'gnome-control-center: System settings'
            'gnome-screensaver: Lock screen'
            'network-manager-applet: Network management')
provides=('budgie-desktop')
conflicts=('budgie-desktop')
install=budgie-desktop.install
source=("$pkgname"::'git+https://github.com/solus-project/budgie-desktop.git#commit=7071987')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
        ./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
