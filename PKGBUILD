# Maintainer: Steven Spangler <132@ikl.sh>
_pkgname="minirss"
pkgname="${_pkgname}-git"
pkgver=v1.0.0.r1.g2af2112
pkgrel=1
pkgdesc="A minuscule RSS notifier"
arch=("any")
url=https://github.com/132ikl/minirss
license=("GPL3")
depends=("xmlstarlet" "notification-daemon" "bash>=4.0" "xdg-utils")
makedepends=("git")
optdepends=("dunst: enable middle click open link functionality")
provides=("minirss")
conflicts=("minirss")
source=("git+${url}.git")
md5sums=("SKIP")

pkgver()  {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    mkdir -p "${pkgdir}/usr/bin/" "${pkgdir}/usr/lib/systemd/user/"
    install -m755 "${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -m644 "${_pkgname}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
}
