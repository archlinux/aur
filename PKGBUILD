# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-wayland-git
pkgver=0.0.0
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtCompositor, Wayland QPA plugins)"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL')
depends=('qt5-base-git' 'qt5-declarative-git' 'libxcomposite' 'libxkbcommon' 'wayland')
replaces=('qt5-qtwayland-git')
provides=('qt5-wayland')
conflicts=('qt5-wayland')
makedepends=('gcc' 'git')
#_gitroot="git://gitorious.org/qt/qtwayland.git"
_gitroot="git://github.com/plfiorini/qtwayland.git"
#_gitbranch=master
_gitbranch=hawaii-stable
_gitname="qt5-wayland"
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd ${srcdir}/${_gitname}
	qmake CONFIG+=wayland-compositor
	#qmake
	make
}

package() {
	cd ${srcdir}/${_gitname}
	make INSTALL_ROOT="${pkgdir}" install
}
