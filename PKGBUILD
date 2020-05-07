# Maintainer Xichen Zhou <xzhou@xeechou.net>

pkgname=taiwins-git
_pkgname=taiwins
pkgver=0.1.1
pkgrel=0
pkgdesc="Tiling and floating wayland window manager focused on speed and size"
url="https://taiwins.org"
license=('GPL2')
source=("git+http://github.com/${_pkgname}/${_pkgname}.git")
md5sums=('SKIP')
arch=('x86_64')

depends=( 'glibc' 'wayland' 'libxkbcommon' 'libinput' 'pixman' 'libdrm' 'pam'
          'systemd-libs' 'dbus' 'lua' 'libxcursor' 'cairo' 'fontconfig' 'freetype2'
          'librsvg' 'xorg-server-xwayland' 'libgl' 'libegl' 'libgles' )

makedepedends=('cmake' 'git')

prepare() {
    cd $srcdir/${_pkgname}
    git submodule update --init --recursive
    cmake -S. -DCMAKE_INSTALL_PREFIX=/usr -Bbuild
}

build() {
    cd $srcdir/${_pkgname}/build
    make
}

package() {
    cd $srcdir/${_pkgname}/build
    make DESTDIR=$pkgdir install
    install -Dm644 $srcdir/${_pkgname}/LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

#vim: syntax=sh
