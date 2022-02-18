# Contributor: taotieren <admin@taotieren.com>

pkgname=fantascene-dynamic-wallpaper-git
srcname=fantascene-dynamic-wallpape-git
pkgver=1.2.8.r18.gf2b6c7b
pkgrel=1
pkgdesc="Deepin Desktop Environment dynamic wallpaper/ DDE 动态壁纸"
arch=('x86_64')
url="https://github.com/dependon/fantascene-dynamic-wallpaper"
license=('GPLv3')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-git})
#replaces=(${pkgname})
depends=( 'qt5-tools' 'qt5-base' 'libxext' 'libx11' 'glib2' 'qt5-x11extras' 'qt5-webengine' 'gcc' 'mpv' 'ffmpeg' 'fakeroot' 'xcb-util-image')
makedepends=('git' 'qconf')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd "${srcdir}/${pkgname%-git}"
   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    qmake ./${pkgname%-git}.pro -spec linux-g++ CONFIG+=qtquickcompiler -o build/
    make -C ./build
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make INSTALL_ROOT="${pkgdir}" -C ./build install
}
