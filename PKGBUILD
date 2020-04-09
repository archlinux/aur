# Maintainer: nsz32 <nszabo2 at gmail dot com>

pkgname=xfce4-taskbar-plugin-git
pkgver=20200409
pkgrel=1
pkgdesc='A simple Taskbar for XFCE4'
arch=('i686' 'x86_64')
url='https://github.com/mirkobrombin/xfce4-taskbar-plugin'
license=('GPL3')
depends=('xfce4-panel>=4.4' 'xfce4-dev-tools' 'libwnck3' 'libxfce4ui' 'gtk3' 'cairo')
makedepends=('git')

source=(git://github.com/mirkobrombin/xfce4-taskbar-plugin)
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/xfce4-taskbar-plugin"
	git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
	cd "${srcdir}/xfce4-taskbar-plugin"
	./autogen.sh
}

build() {
	cd "${srcdir}/xfce4-taskbar-plugin"
	make
}

package() {
	cd "${srcdir}/xfce4-taskbar-plugin"
	mkdir -p "${pkgdir}/usr/lib/xfce4/panel/plugins"
	mkdir -p "${pkgdir}/usr/share/xfce4/panel/plugins"

	cp -f src/.libs/libtaskbar.so   "${pkgdir}/usr/lib/xfce4/panel/plugins/"
	cp -f taskbar.desktop "${pkgdir}/usr/share/xfce4/panel/plugins/"
}
