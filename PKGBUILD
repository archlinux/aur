# Maintainer: Eric Renfro <psi-jack@linux-help.org>

_pkgbase=xfce-session-target
pkgname=${_pkgbase}-git
pkgdesc='systemd Integration for xfce-session'
pkgver=1.3.2.r0.gb2163b1
pkgrel=1
arch=('any')
url="https://git.linux-help.org/infusix/${_pkgbase}"
license=('GPL')
makedepends=('coreutils' 'git')
source=("${_pkgbase}::git+https://git.linux-help.org/infusix/${_pkgbase}.git")
sha256sums=('SKIP')
depends=('xfce4-session' 'systemd')
#install=${_pkgbase}.install

pkgver() {
    cd "${srcdir}/${_pkgbase}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -d ${pkgdir}/usr/lib/xfce4/session
    install -d ${pkgdir}/usr/lib/systemd/user
    install -d ${pkgdir}/etc/xdg/autostart
    install -d ${pkgdir}/usr/share/doc/${pkgname}
    cp -f ${srcdir}/${_pkgbase}/src/*.sh ${pkgdir}/usr/lib/xfce4/session/
    cp -f ${srcdir}/${_pkgbase}/src/*.target ${pkgdir}/usr/lib/systemd/user/
    cp -f ${srcdir}/${_pkgbase}/src/*.desktop ${pkgdir}/etc/xdg/autostart/
    cp -f ${srcdir}/${_pkgbase}/README $srcdir/${_pkgbase}/LICENSE ${pkgdir}/usr/share/doc/$pkgname/
    cp -fR ${srcdir}/${_pkgbase}/examples ${pkgdir}/usr/share/doc/${pkgname}/
}
