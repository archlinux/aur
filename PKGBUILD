# Maintainer: urain39 <hexiedeshijie@gmail.com>

pkgname=myget
pkgver=0.1.1
pkgrel=1
pkgdesc="Mytget is a muti-thread downloader accelerator for GNU/Linux."
arch=('i686' 'x86_64' 'aarch64')
url="http://myget.sourceforge.net"
license=('GPLv2')
depends=()
optdepends=()
makedepends=(
    'cmake'
    'doxygen'
)

source=('git+https://github.com/lytsing/mytget.git')
md5sums=('SKIP')

install=${pkgname}.install

build() {
    cd ${srcdir}/mytget
    cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
    make
}

vote_package() {
    echo "===> Vote for this package?(Y/n)"; read option
    case $option in
    N|n)
        return
        ;;
    *)
        if [ ! -e /usr/bin/aurvote ]; then
            sudo pacman -S aurvote 2> /dev/null
            #echo "y" | sudo pacman -S aurvote
        fi

        echo "===> NOTE: Please login your account"
        aurvote --configure
        aurvote -v myget

        echo "===> Thanks ! ^_^"
        ;;
    esac
}

package() {
    cd ${srcdir}/mytget
    
    make install DESTDIR=${pkgdir}
    #install -Dm0755 ${srcdir}/src/mytget ${pkgdir}/usr/bin/mytget
    
    echo "All done!" && vote_package
}

# vim: set ts=4 tw=60 sw=4 et:
