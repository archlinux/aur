# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-wayland-git
pkgver=20130521
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
_gitname=qt5-qtwayland
#_gitbranch=master
_gitbranch=hawaii-stable

build() {
	if [ ! -d "${_gitname}" ]; then
		git clone -b ${_gitbranch} --depth 1 ${_gitroot} ${_gitname} && cd ${_gitname}
	else
		cd ${_gitname} && git reset --hard && git pull origin && git clean -dfx
	fi

	msg "GIT checkout done."

	#qmake CONFIG+=wayland-compositor
	qmake
	make
}

package() {
	cd "${_gitname}"

	make INSTALL_ROOT="${pkgdir}" install
}
