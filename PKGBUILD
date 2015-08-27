# Maintainer: Christian Babeux <christian.babeux@0x80.ca>

pkgname=lttng-modules-git
_gitname="lttng-modules"
pkgver=2.7.0.rc1.11.gc7d89a6
pkgrel=1
pkgdesc="Kernel Modules for LTTng"
arch=('i686' 'x86_64')
url="http://lttng.org/"
license=('LGPL2.1' 'GPL2' 'MIT')
depends=('linux>=2.6.38')
makedepends=('linux-headers' 'git')
provides=('lttng-modules')
conflicts=('lttng-modules')
install=${pkgname}.install
source=('git://git.lttng.org/lttng-modules.git')
sha1sums=('SKIP')

pkgver()
{
    cd ${_gitname}
    git describe --always | sed 's/-/./g;s/^v//'
}


build()
{
    cd ${_gitname}
    make
}

package() 
{
    cd ${_gitname}
    make modules_install INSTALL_MOD_PATH=${pkgdir}/usr
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
