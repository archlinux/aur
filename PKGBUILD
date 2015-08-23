# Maintainer: Luca Béla Palkovics <luca.bela.palkovics@gmail.com>

pkgrel=1
pkgver=alpha.r56.gf7917f3
pkgname=('gtox-git')
pkgdesc="a GTK-based tox-client"
url="https://github.com/KoKuToru/gTox.git"
license='GPL3'
arch=('i686' 'x86_64')
depends=('gtkmm3' 'gettext' 'desktop-file-utils' 'gtk-update-icon-cache' 'gstreamermm' 'flatbuffers' 'tox-git')
makedepends=('git' 'cmake' 'librsvg')
source=("${pkgname%-git}::git+https://github.com/KoKuToru/gTox.git#branch=AUR")
conflicts=('gtox')
install="gTox.install"

pkgver()
{
     cd ${pkgname%-git}
     ( set -o pipefail
       git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
       printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
     )
}


build()
{
    cd ${pkgname%-git}
    cd src
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr ..
    make
}

package()
{
        cd ${pkgname%-git}
        cd src
        cd build
        make install
}
md5sums=('SKIP')
