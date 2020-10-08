# $Id$
# Maintainer: Popolon <popolon@popolon.org>

pkgname=openjardin-git
_gitname=openjardin-code
#_branchname=1.04-03
pkgver=32.dd4edd4
pkgrel=1
pkgdesc="graphic garden management, Land lot mapping, planing of crop rotation"
arch=('i686' 'x86_64' 'armv7h' 'armv8')
url="http://openjardin.eu/"
license=('GPLv3')
depends=('qt5-svg' 'qt5-multimedia' 'qt5-xmlpatterns' 'qt5-base')
makedepends=('git' 'qt5-tools')
provides=('openjardin')
conflicts=('openjardin')
source=("${_gitname}::git+https://git.code.sf.net/p/openjardin/code")
md5sums=('SKIP')

pkgver()
{
    cd "${_gitname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build()
{
    cd "${_gitname}"
    qmake PREFIX=/usr
    make
}

package()
{
    cd "${_gitname}"
    make install INSTALL_ROOT="${pkgdir}"
    install -Dm644 A_LIRE.TXT -t "${pkgdir}/usr/share/${pkgname}"
    install -Dm644 jardin.sqli -t "${pkgdir}/usr/share/${pkgname}"
    install -Dm644 jardin_exemple.xml -t "${pkgdir}/usr/share/${pkgname}"
    install -Dm644 jardin_type.png -t "${pkgdir}/usr/share/${pkgname}"
    install -Dm755 openjardin -t "${pkgdir}/usr/bin/"
}
