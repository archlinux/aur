# Maintainer: Maximilian Kindshofer <maximilian@kindshofer.net>
# Maintainer: Fabio Loli <loli_fabio@protonmail.com> -> https://github.com/FabioLolix

pkgname=kitty-git
pkgver=0.8.0.r38.g54ed08c
pkgrel=1
pkgdesc="A modern, hackable, featureful, OpenGL based terminal emulator"
arch=('i686' 'x86_64')
url="https://github.com/kovidgoyal/kitty"
license=('GPL3')
depends=('python3' 'freetype2'  'fontconfig' 'wayland' 'libx11')
makedepends=('git' 'pkg-config' 'python-setuptools' 'libxinerama' 'libxcursor' 'libxrandr' 'libxkbcommon' 'libxkbcommon-x11' 'glfw-x11' 'wayland-protocols' 'mesa')
optdepends=('imagemagick: viewing images with icat')
provides=('kitty')
conflicts=('kitty' 'kitty-git')
source=('git+https://github.com/kovidgoyal/kitty.git')
md5sums=('SKIP')

pkgver() {
    cd kitty
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/kitty"
        python3 setup.py linux-package
    }

package() {
    cd "$srcdir/kitty/linux-package"
    install -d $pkgdir/usr/{bin,lib,share}
    cp -r bin/* $pkgdir/usr/bin
    cp -r share/* $pkgdir/usr/share/
    cp -r lib/* $pkgdir/usr/lib/

    install -d ${pkgdir}/usr/share/pixmaps/
    mv ${pkgdir}/usr/share/icons/hicolor/256x256/apps/kitty.png ${pkgdir}/usr/share/pixmaps/kitty.png
    rm -R ${pkgdir}/usr/share/icons
    }
