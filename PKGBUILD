# Maintainer: Pedro Henrique <pedro00dk@gmail.com>
pkgname=overgrive
pkgver=3.3.2
pkgrel=0
pkgdesc='A complete Google Drive™ desktop client solution for Linux'
arch=('x86_64')
url='https://www.thefanclub.co.za/overgrive'
license=('unknown')

# original overgrive dependencies
# libnotify python3 python-oauth2client python-pyinotify python-pip python-gobject libappindicator-gtk3
depends=(libappindicator-gtk3 libnotify python3 python-gobject python-oauth2client python-pyinotify)

provides=('overgrive')
conflicts=('overgrive')
install='overgrive.install'
changelog=

source=('https://www.thefanclub.co.za/sites/default/files/public/overgrive/overgrive-3.3.2-0-any.pkg.tar.xz')
noextract=('overgrive-3.3.2-0-any.pkg.tar.xz')
md5sums=('e33e8990b637ecbacea36f5a8ea23b7c')

prepare() {
    tar --extract --file='./overgrive-3.3.2-0-any.pkg.tar.xz'
    rm -- './overgrive-3.3.2-0-any.pkg.tar.xz'
    sed --in-place -- \
        's+Exec=python3+Exec=/opt/thefanclub/overgrive/venv/bin/python3+g' \
        './usr/share/applications/overgrive.desktop' \
        './opt/thefanclub/overgrive/overgrive-autostart.desktop'
}

package() {
    cp --recursive -- './opt/' './usr/' "${pkgdir}/"
}
