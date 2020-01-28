# Maintainer: Pedro Henrique <pedro00dk@gmail.com>
pkgname=overgrive
pkgver=3.3.7
pkgrel=0
pkgdesc='A complete Google Drive™ desktop client solution for Linux'
arch=('x86_64')
url='https://www.thefanclub.co.za/overgrive'
license=('unknown')

# original overgrive dependencies
# libnotify python python-oauth2client python-pyinotify python-pip python-gobject libappindicator-gtk3
depends=(libappindicator-gtk3 libnotify python python-gobject python-oauth2client python-pyinotify)

provides=('overgrive')
conflicts=('overgrive')
install='overgrive.install'
changelog=

source=('https://www.thefanclub.co.za/sites/default/files/public/overgrive/overgrive-3.3.7-0-any.pkg.tar.xz')
noextract=('overgrive-3.3.7-0-any.pkg.tar.xz')
md5sums=('1f44a4b705a58be1b94a22b73ad7c56')

prepare() {
    tar --extract --file=./overgrive-3.3.7-0-any.pkg.tar.xz
    rm -- ./overgrive-3.3.7-0-any.pkg.tar.xz
    # chmod 0755 ./opt/thefanclub/overgrive/__pycache__/overgrive.cpython-38.pyc

    # script to execute through terminal 
    mkdir --parents ./usr/bin/
    echo -e '#!/usr/bin/sh\n/opt/thefanclub/overgrive/venv/bin/python /opt/thefanclub/overgrive/overgrive' \
        > ./usr/bin/overgrive
    chmod +x ./usr/bin/overgrive

    
    # update .desktop files
    sed --in-place -- \
        's+Exec=.*+Exec=/usr/bin/overgrive+g' \
        ./usr/share/applications/overgrive.desktop \
        ./opt/thefanclub/overgrive/overgrive-autostart.desktop
}

package() {
    cp --recursive -- ./opt/ ./usr/ "${pkgdir}/"
}
