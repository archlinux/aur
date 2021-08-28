# Maintainer : Yamada hayao <hayao@fascode.net>
# Contributer: nsz32 <nszabo2 at gmail dot com>

pkgname=xfce4-docklike-plugin-git
pkgver=20210828
pkgrel=1
pkgdesc='A modern, docklike, minimalist taskbar for XFCE (Forked version)'
arch=('i686' 'x86_64')
url='https://github.com/davekeogh/xfce4-docklike-plugin'
#url='https://github.com/Hayao0819/xfce4-docklike-plugin'
license=('GPL3')
depends=('xfce4-panel>=4.4' 'libwnck3' 'libxfce4ui' 'gtk3' 'cairo' 'glib2')
makedepends=('git' 'xfce4-dev-tools' 'intltool')

source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/xfce4-docklike-plugin"
	git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
	cd "${srcdir}/xfce4-docklike-plugin"
	./autogen.sh
}

build() {
	cd "${srcdir}/xfce4-docklike-plugin"
	make
}

package() {
	cd "${srcdir}/xfce4-docklike-plugin"
	make DESTDIR="${pkgdir}" install
}
