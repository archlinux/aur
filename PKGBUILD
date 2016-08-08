# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-tweak
pkgver=16.10.4
_umsver=16.10.7
pkgrel=1
pkgdesc="Tweak tool for MATE, a fork of MintDesktop"
arch=('any')
url="https://bitbucket.org/ubuntu-mate/mate-tweak"
license=('GPL')
depends=('gtk3' 'libnotify' 'mate-applets-gtk3' 'python-configobj' 'python-gobject' 'python-psutil' 'python-setproctitle')
makedepends=('python-distutils-extra' 'python-setuptools')
optdepends=('mate-applet-dock: for Mutiny panel layout'
            'mate-menu: to enable advanced menu'
            'mate-netbook-gtk3: for Netbook panel layout'
            'plank: for Cupertino panel layout'
            'synapse: to enable launcher'
            'tilda: to enable pull-down terminal'
            'topmenu-gtk: for Mutiny panel layout')
source=("$pkgname-$pkgver.tar.gz::https://bitbucket.org/ubuntu-mate/$pkgname/get/$pkgver.tar.gz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/ubuntu-mate-settings_$_umsver.tar.xz"
        "fix-mutiny-fresh.patch")
sha256sums=('474a4ee963554650f963223430a7e5d7e4d08e8ef00f4a7c76dc4515a2f181fe'
            'bf0046befe9b8704e5b9972fc86da3847b0b458b72a186f8ebf5d7b30ee591ac'
            'ac2ade84a532486c50245a176d370f0815330f13df07fd62e133afe0383db5fc')

prepare() {
  cd ubuntu-mate-$pkgname-*
  sed -i 's|/usr/lib/mate-applets/topmenu-mate-panel-applet|/usr/lib/topmenu-gtk/topmenu-mate-panel-applet|' mate-tweak
  cd ../ubuntu-mate-settings
  patch -Np1 -i ../fix-mutiny-fresh.patch
}

package() {
  cd ubuntu-mate-$pkgname-*
  python3 setup.py install --root="$pkgdir" --optimize=1
  cp -r "$srcdir"/ubuntu-mate-settings/usr/share/mate-panel "$pkgdir/usr/share"
}
