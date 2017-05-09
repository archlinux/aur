# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-tweak
pkgver=17.10.1
_umsver=17.10.3
pkgrel=1
pkgdesc="Tweak tool for MATE (fork of MintDesktop)"
arch=('any')
url="https://bitbucket.org/ubuntu-mate/mate-tweak"
license=('GPL')
depends=('libnotify' 'mate-applets' 'python-configobj' 'python-gobject' 'python-psutil' 'python-setproctitle')
makedepends=('python-distutils-extra' 'python-setuptools')
optdepends=('mate-applet-dock: for Mutiny panel layout'
            'mate-menu: to enable advanced menu'
            'mate-netbook: for Netbook panel layout'
            'plank: for Cupertino panel layout'
            'synapse: to enable launcher'
            'tilda: to enable pull-down terminal'
            'topmenu-gtk: for Mutiny panel layout')
source=("$pkgname-$pkgver.tar.gz::https://bitbucket.org/ubuntu-mate/$pkgname/get/$pkgver.tar.gz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/ubuntu-mate-settings_$_umsver.tar.xz"
        "fix-mutiny-fresh.patch")
sha256sums=('5d1004587116ebb7b5d59b20c466d217db973c84472dc561aae33c967d7ecb6a'
            'f175a2dd16dbc946fc3b274819b638278e074dd031c33053c93573d5f2fb2c92'
            'ac2ade84a532486c50245a176d370f0815330f13df07fd62e133afe0383db5fc')

prepare() {
  cd ubuntu-mate-$pkgname-*
  sed -i 's|/usr/lib/mate-applets/topmenu-mate-panel-applet|/usr/lib/topmenu-gtk/topmenu-mate-panel-applet|' mate-tweak
  cd ../ubuntu-mate-settings
  patch -Np1 -i ../fix-mutiny-fresh.patch
}

package() {
  cd ubuntu-mate-$pkgname-*
  python setup.py install --root="$pkgdir" --optimize=1
  cp -r "$srcdir"/ubuntu-mate-settings/usr/share/mate-panel "$pkgdir/usr/share"
}
