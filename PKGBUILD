# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=discord-overlay-git
pkgver=r77.51a1a0f
pkgrel=1
pkgdesc="QT5 Overlay for discord"
arch=('x86_64')
url="https://github.com/trigg/DiscordOverlayLinux"
license=('GPL3')
depends=('python' 'qt5-webengine' 'python-pyqtwebengine' 'python-pyqt5' 'python-pyxdg')
makedepends=('git' 'python-setuptools')
optdepends=('picom: transparency support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('discord-overlay::git+https://github.com/trigg/DiscordOverlayLinux')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    
    # maintaining this comment for when/if there is a tag added to the repo
	# printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build () {
	cd "$srcdir/${pkgname%-git}"
    python setup.py build
}


package() {
	cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
