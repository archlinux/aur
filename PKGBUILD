# Maintainer: sballert <sballert@posteo.de>

pkgname=lejos-ev3
_pkgver=0.9.1-beta
pkgver=0.9.1.beta
pkgrel=1
pkgdesc="A firmware and toolchain for programming the Lego EV3 in Java"
arch=('any')
license=('GPL3')
url="http://lejos.sourceforge.net/"
depends=('java-environment')
source=("https://downloads.sourceforge.net/project/ev3.lejos.p/${_pkgver}/leJOS_EV3_${_pkgver}.tar.gz")
md5sums=('e58802d784ba990c09b4196fc99dc0ab')

package() {
    cd leJOS_EV3_${_pkgver}

    # create directories
    install -d -m755 "${pkgdir}"/opt/lejos-ev3/{bin,lib}
    install -d -m755 "${pkgdir}"/opt/lejos-ev3/lib/{ev3,pc}
    install -d -m755 "${pkgdir}/opt/lejos-ev3/lib/ev3/3rdparty"
    install -d -m755 "${pkgdir}/opt/lejos-ev3/lib/pc/3rdparty"

    # install files
    install -m755 -t "${pkgdir}/opt/lejos-ev3/bin" bin/*
    install -m644 -t "${pkgdir}/opt/lejos-ev3/lib/ev3/" lib/ev3/{*.jar,*.zip}
    install -m644 -t "${pkgdir}/opt/lejos-ev3/lib/pc/" lib/pc/{*.jar,*.zip}
    install -m644 -t "${pkgdir}/opt/lejos-ev3/lib/ev3/3rdparty" lib/ev3/3rdparty/*.jar
    install -m644 -t "${pkgdir}/opt/lejos-ev3/lib/pc/3rdparty" lib/pc/3rdparty/{*.jar,*.zip}

    # copy docs
    cp -r docs/* "${pkgdir}/opt/lejos-ev3/docs"

    # create links
    install -d -m755 "${pkgdir}/usr/bin"
    cd "${pkgdir}/opt/lejos-ev3/bin"
    for i in ev3*; do ln -sf "/opt/lejos-ev3/bin/${i}" "${pkgdir}/usr/bin/"; done
}
