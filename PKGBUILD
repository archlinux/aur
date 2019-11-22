# Maintainer: vagnum08 <vagnum08@gmail.com>

pkgname=cpupower-gui
pkgver=0.7.0
pkgrel=2
pkgdesc="A GUI utility to set CPU frequency limits"
arch=(any)
url="https://gitlab.com/vagnum08/cpupower-gui"
license=('GPL')
depends=('python' 'gtk3' 'hicolor-icon-theme' 'polkit' 'python-dbus' 'python-gobject')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
                      'lxsession: needed for authentification in Xfce, LXDE etc.')
makedepends=('autoconf-archive')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}_${pkgver}.orig.tar.gz"::"https://github.com/vagnum08/cpupower-gui/archive/v${pkgver}.tar.gz"
               "fix-dbus.patch")
sha256sums=('8fd21c60bd6ea75f2a9b26a72ac6711465ba10c5461788cbdbde89b82e280e99'
            '86b689957b4f34b838c36731ab874acdbe84ee09242eab0bdcadf3550540965a')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    patch -Np1 -i ../fix-dbus.patch
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
