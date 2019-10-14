# Maintainer: Nils Christopher Brause <nilschrbrause@googlemail.com>
pkgname=waylandpp-git
pkgver=295
pkgrel=1
pkgdesc='Wayland C++ bindings'
arch=('i686' 'x86_64' 'armv5' 'armv6' 'armv7' 'armv8')
url='https://github.com/NilsBrause/waylandpp'
licanse=('MIT' 'GPL3')
depends=(wayland pugixml)
provides=(waylandpp)
conflicts=(waylandpp)
makedepends=(cmake git egl-wayland)
source=("${pkgname}::git+https://github.com/NilsBrause/waylandpp.git")
md5sums=('SKIP')

pkgver()
{
    cd $pkgname
    git log --pretty=oneline | wc -l
}

build()
{
    cd $pkgname
    rm -rf build
    mkdir build
    cd build
    # lib64 is a symlink to lib on archlinux.
    cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_INSTALL_LIBDIR="lib" ..
    make
}

package()
{
    cd $pkgname/build
    DESTDIR="$pkgdir" make install
}

# Local Variables:
# mode: shell-script
# End:
