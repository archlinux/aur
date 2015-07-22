# Maintainer: Ted Meyer <tmathmeyer@gmail.com>

_pkgname=netmenu
pkgname=${_pkgname}
pkgver=2
pkgrel=1
pkgdesc='A wifi controller for dmenu'
arch=('x86_64')
url="https://github.com/tmathmeyer/${_pkgname}"
license=('GPL')
depends=(dmenu)
makedepends=('git')
optdepends=(systemd)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/tmathmeyer/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    installDir="$pkgdir/usr/bin"
    systemDir="$pkgdir/etc/systemd/system"
    install -dm755 "$systemDir"
    install -dm755 "$installDir"
    install -m755 "$srcdir/$_pkgname/netmenu.service" "$systemDir/netmenu.service"
    install -m755 "$srcdir/$_pkgname/netmenu" "$installDir/netmenu"
    install -m755 "$srcdir/$_pkgname/netctld" "$installDir/netctld"
    install -m755 "$srcdir/$_pkgname/netctldcli" "$installDir/netctldcli"
    install -m755 "$srcdir/$_pkgname/netctldlist" "$installDir/netctldlist"
}
