# Maintainer: Luca Béla Palkovics <luca.bela.palkovics@gmail.com>

pkgrel=1
pkgver=r725.ea49317
pkgname=('gtox-git')
pkgdesc="a GTK-based tox-client"
url="https://github.com/KoKuToru/gTox.git"
license='GPL3'
arch=('i686' 'x86_64')
depends=('gtkmm3' 'libnotifymm' 'libconfig' 'sqlite' 'gettext' 'libcanberra' 'desktop-file-utils' 'gtk-update-icon-cache' 'gstreamermm' 'tox-git')
makedepends=('check' 'git' 'cmake' 'librsvg')
source=("${pkgname%-git}::git+https://github.com/KoKuToru/gTox.git")
conflicts=('gtox')
install="gTox.install"

pkgver()
{
     cd ${pkgname%-git}
     ( set -o pipefail
       git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
       printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
     )
}


build()
{
    cd ${pkgname%-git}
    git submodule init
    git submodule update
    cd Source
    mkdir Build
    cd Build
    cmake -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr ..
    make
}

package()
{
        cd ${pkgname%-git}
        cd Source
        cd Build
        make install
}
md5sums=('SKIP')
