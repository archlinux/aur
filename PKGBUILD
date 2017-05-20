# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-tweak
pkgver=17.10.2
_umsver=17.10.6
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
        "https://launchpad.net/ubuntu/+archive/primary/+files/ubuntu-mate-settings_$_umsver.tar.xz")
sha256sums=('bdd676636039170b8ae13c4fa5065e48f95bcc433a8c6888bc928139141a1b03'
            'c2ee4d26517672bb5c1628390fbb04998b6563777f0b4eea30b3b8abe0b7d606')

prepare() {
  cd ubuntu-mate-$pkgname-*
  sed -i 's|/usr/lib/mate-applets/topmenu-mate-panel-applet|/usr/lib/topmenu-gtk/topmenu-mate-panel-applet|' mate-tweak
}

package() {
  cd ubuntu-mate-$pkgname-*
  python setup.py install --root="$pkgdir" --optimize=1
  cp -r "$srcdir"/ubuntu-mate-settings/usr/share/mate-panel "$pkgdir/usr/share"
}
