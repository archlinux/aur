# Maintainer: Maximilian Kindshofer <maximilian@kindshofer.net>
pkgname=kitty-git
pkgver=r696.0d38a2e
pkgrel=1
pkgdesc="A modern, hackable, featureful, OpenGL based terminal emulator" # you've missed pkgdesc which is neccessary
arch=('i686' 'x86_64')
url="https://github.com/kovidgoyal/kitty"
license=('GPL3')
depends=('python3' 'glew' 'glfw-x11' 'freetype2' 'xorg-xdpyinfo')
makedepends=('git' 'pkg-config' 'python-setuptools')
source=('git+https://github.com/kovidgoyal/kitty.git')
md5sums=('SKIP')

pkgver() {
    cd kitty
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    }

build() {
	cd "$srcdir/kitty"
        python3 setup.py linux-package
    }

package() {
    cd "$srcdir/kitty/linux-package"
    mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/lib/
    mkdir -p $pkgdir/usr/share
    cp -r bin/* $pkgdir/usr/bin
    cp -r share/* $pkgdir/usr/share/
    cp -r lib/* $pkgdir/usr/lib/
    }
