# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=lxde-common-gtk3
_pkgname=lxde-common
pkgver=0.99.0
pkgrel=1
pkgdesc='Common files of the LXDE Desktop (GTK+ 3 version)'
arch=('any')
url='http://lxde.org/'
license=('GPL2')
groups=('lxde-gtk3')
backup=(etc/xdg/lxsession/LXDE/desktop.conf
        etc/xdg/lxsession/LXDE/autostart)
depends=('lxsession-gtk3')
makedepends=('intltool')
conflicts=($_pkgname)
source=(http://downloads.sourceforge.net/lxde/$_pkgname-$pkgver.tar.xz
        dbus-update-environment.patch)
md5sums=('5a417f5a0e5b510a0c018b66b0dc4081'
         '9f5cdfb8aef6286b6de79a50d1fddd7f')

prepare() {
    cd $_pkgname-$pkgver
    patch -Np1 -i ../dbus-update-environment.patch
    sed -i 's|sNet/ThemeName=Clearlooks|sNet/ThemeName=Adwaita|
            s|sNet/IconThemeName=nuoveXT2|sNet/IconThemeName=Adwaita|' desktop.conf
}

build() {
    cd $_pkgname-$pkgver
    ./configure --sysconfdir=/etc --prefix=/usr
    make
}

package() {
    cd $_pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
