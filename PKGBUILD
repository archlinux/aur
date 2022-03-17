# Maintainer: demonkingswarn <demonkingswarn at protonmail dot com>
pkgname=demon-terminal
pkgrel=1
pkgver=0.1_r2.bfc5367
pkgdesc="A simple minimalistic terminal written in C++."
arch=('any')
url="https://github.com/demonkingswarn/${pkgname}"
license=('MIT')
makedepends=('git' 'gcc')
source=(git+https://github.com/demonkingswarn/${pkgname})
sha256sums=('SKIP')

pkgver() {
    cd "$(pkgname)"
	printf "0.1_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"
	g++ $(pkg-config --cflags --libs Qt5Widgets qtermwidget5) -fPIC -o dt demon-term.cpp
	cp dt $HOME/.local/bin/dt
	mkdir -p $HOME/.local/share/applications
	cp dt.desktop $HOME/.local/share/applications/dt.desktop
}

