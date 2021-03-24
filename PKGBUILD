# Maintainer: brombinmirko <send at mirko dot pm>

pkgname=xfce4-taskbar-plugin-git
pkgver=20201015
pkgrel=1
pkgdesc='A simple Taskbar for XFCE4'
arch=('i686' 'x86_64')
url='https://github.com/mirkobrombin/xfce4-taskbar-plugin.git'
license=('GPL3')
depends=('xfce4-panel>=4.4' 'xfce4-dev-tools' 'libwnck3' 'libxfce4ui' 'gtk3' 'cairo')
makedepends=('git')

source=("git+https://github.com/mirkobrombin/xfce4-taskbar-plugin.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/xfce4-taskbar-plugin"
	git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
	cd "${srcdir}/xfce4-taskbar-plugin"
  	_pkgver=$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
	./autogen.sh
}

build() {
	cd "${srcdir}/xfce4-taskbar-plugin"
	make
}

package() {
	cd "${srcdir}/xfce4-taskbar-plugin"
	make DESTDIR="${pkgdir}" install
}
