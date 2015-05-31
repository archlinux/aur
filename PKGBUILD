# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=vim3d-git
pkgver=0.0
pkgrel=1
pkgdesc="vi-style interface to 3D modeling and simulation built in C++ and OpenGL"
url="http://www.vim3d.com/"
arch=('x86_64' 'i686')
license=('custom')
depends=('freeglut' 'glu' 'mesa')
makedepends=('git')
source=("vim3d::git+https://github.com/pyramation/vim3d")
md5sums=('SKIP')

pkgver() {
      cd "$srcdir/vim3d"
        git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
 
build() {
    cd "${srcdir}/vim3d/src"
    make
}
  
package() {
    # binary
    install -D "${srcdir}/vim3d/src/vim3d" "${pkgdir}/usr/bin/vim3d"

    # support files
    mkdir -p "${pkgdir}"/usr/share/{doc/vim3d,vim3d}
    cp -r "${srcdir}"/vim3d/docs/* "${pkgdir}/usr/share/doc/vim3d"
    cp -r "${srcdir}"/vim3d/{scenes,textures,objects,Channels} "${pkgdir}/usr/share/vim3d/"

    # license
    install -Dm444 "${srcdir}/vim3d/LICENSE.txt" "${pkgdir}/usr/share/licenses/vim3d-git/LICENSE"
}
