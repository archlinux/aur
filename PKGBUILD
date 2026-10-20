# Maintainer: Jonathan Birk (cafce25) <cafce25@gmail.com>
# Contributor: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=nitrokey-app2
pkgname=${_pkgname}-git
pkgver=2.7.1.r74.g5b7d8f9
pkgrel=1
pkgdesc='Nitrokey management application for Nitrokey 3 devices'
arch=('any')
url='https://github.com/Nitrokey/nitrokey-app2'
license=('Apache-2.0')
depends=('python-nitrokey' 'pyside6' 'python-qt-material' 'qt6-tools' 'qt6-svg' 'python-pyudev' 'hicolor-icon-theme' 'python-usb_monitor')
makedepends=('python-poetry' 'git')
source=("git+${url}")
sha256sums=('SKIP')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 | sed 's/v\(.*\)/\1/;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dv meta/com.nitrokey.nitrokey-app2.desktop "$pkgdir/usr/share/applications/com.nitrokey.nitrokey-app2.desktop"
    install -Dvm 644 meta/nk-app2.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.nitrokey.nitrokey-app2.svg"
}
