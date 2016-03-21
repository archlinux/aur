# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-tweak
pkgver=3.5.8
_umsver=16.04.4
pkgrel=1
pkgdesc="Tweak tool for MATE, a fork of mintDesktop"
arch=('any')
url="https://bitbucket.org/ubuntu-mate/mate-tweak"
license=('GPL')
depends=('gtk3' 'libnotify' 'mate-applets' 'python-configobj' 'python-gobject' 'python-psutil')
makedepends=('python-distutils-extra' 'python-setuptools')
optdepends=('gnome-main-menu: for openSUSE panel layout'
            'mate-applet-dock: for Mutiny panel layout'
            'mate-menu: to enable advanced menu'
            'plank: for Cupertino panel layout'
            'topmenu-gtk: for Mutiny panel layout')
source=("$pkgname-$pkgver.tar.gz::https://bitbucket.org/ubuntu-mate/$pkgname/get/$pkgver.tar.gz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/ubuntu-mate-settings_$_umsver.tar.xz"
        "fix-mutiny-fresh.patch")
sha256sums=('3d3f73704439378702801fc0b7f2c68fc29131e822209c20d81aa934037e38dc'
            '7d45f72f3bd0adc1200a3feccdc7593890eb4439fc4df43fc3577cb79ce42cb9'
            'ac2ade84a532486c50245a176d370f0815330f13df07fd62e133afe0383db5fc')

prepare() {
  cd ubuntu-mate-$pkgname-*
  sed -i 's|/usr/lib/mate-applets/topmenu-mate-panel-applet|/usr/lib/topmenu-gtk/topmenu-mate-panel-applet|' mate-tweak
  cd ../ubuntu-mate-settings-*
  patch -Np1 -i ../fix-mutiny-fresh.patch
}

package() {
  cd ubuntu-mate-$pkgname-*
  python3 setup.py install --root="$pkgdir" --optimize=1
  cp -r "$srcdir"/ubuntu-mate-settings-*/usr/share/mate-panel "$pkgdir/usr/share"
}
