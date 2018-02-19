# Maintainer: vagnum08 <vagnum08@gmail.com>

pkgname=cpupower-gui-git
pkgver=0.6.0.r0.ga294ea4
pkgrel=1
pkgdesc="A GUI utility to set CPU frequency limits"
arch=(any)
url="https://gitlab.com/vagnum08/cpupower-gui"
license=('GPL')
depends=('python' 'gtk3' 'hicolor-icon-theme' 'polkit' 'python-dbus' )
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
                      'lxsession: needed for authentification in Xfce, LXDE etc.')
makedepends=('git' 'autoconf-archive')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://gitlab.com/vagnum08/cpupower-gui.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
