# Maintainer: envolution
# Contributor: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Barfin
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# shellcheck shell=bash disable=SC2034,SC2154
# Contributors: Jekyll Wu, Jacco Koning, qwak, twa022, tee

pkgname=usb-creator
pkgver=0.4.1
pkgrel=1
pkgdesc="Create bootable USB from a LiveCD or disc image ISO"
arch=('any')
url="https://git.launchpad.net/~usb-creator-hackers/usb-creator/+git/main"
license=('GPL3')
depends=('cdrkit'
  'dosfstools'
  'gtk3'
  'kde-dev-scripts'
  'libisoburn'
  'mtools'
  'parted'
  'python'
  'python-dbus'
  'python-gobject'
  'gobject-introspection'
  'python-pyqt6'
  'syslinux'
  'udisks2')
makedepends=(
  'python-installer'
  'python-build'
  'python-distutils-extra'
)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_$pkgver.tar.xz" unitysupport.py)
b2sums=('c6c7fa29d67057b53d8dc6bd1c8b661f4d31cbc9b2649446f44de03ba1155cebc836066f9f733b935d43e9b68bd8fc2adca59be8b0e5e37bf59de66d19536fc4'
        '41e73bb8e19650cad95b7283952aeb6e411746fb30257575b8bb59cef6c85c7b8651375885a7fda3cb550f2d04dcc52fe4916705cdba1590578fcbe14633e9e0')

prepare() {
  cd $pkgname
  cp -f ../unitysupport.py usbcreator/frontends/gtk/unitysupport.py
  #sed -i 's/except ImportError/except (ImportError, ValueError)//g' usbcreator/frontends/gtk/unitysupport.py
}
build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir"/usr/share/man/man8 man/$pkgname-{gtk,kde}.8
}
# vim:set ts=2 sw=2 et:
