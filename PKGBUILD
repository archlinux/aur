# Maintainer: David Adler <d.adler@posteo.de>

_pkgname=gnucap-models
pkgname=$_pkgname-git
pkgver=20250731.dev.r13.g7dab183
pkgrel=1
pkgdesc="additional device models for Gnucap"
arch=('x86_64')
url="https://git.savannah.gnu.org/cgit/gnucap/gnucap-models.git/"
license=('custom')
depends=('gnucap')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+git://git.git.savannah.gnu.org/gnucap/$_pkgname.git#branch=develop")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_pkgname
    make
}

package() {
    cd $_pkgname
    make DESTDIR="$pkgdir/" install
    
    mv bsim/COPYING COPYING.bsim
    mv jspice3-2.5/COPYING COPYING.jspice3
    mv spice3f5/COPYING COPYING.spice3f5
    install -t \
        "${pkgdir}/usr/share/licenses/$pkgname/" \
        -vDm 644 COPYING.{bsim,spice3f5,jspice3}
}

