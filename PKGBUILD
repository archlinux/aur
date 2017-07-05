# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-tweak
pkgver=17.10.7
_umsver=17.10.11
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
sha256sums=('73779d7d047d2e88c9a0cd3eb8005917e5da38504f449c3bbf17c344df245a2a'
            'e08054b9ee01e84932a4d2745bcf2754f7ea6c61a611aeabe00e7ac2ed120353')

prepare() {
  cd ubuntu-mate-$pkgname-*
  sed -i 's|/usr/lib/mate-applets/topmenu-mate-panel-applet|/usr/lib/topmenu-gtk/topmenu-mate-panel-applet|' mate-tweak
}

package() {
  cd ubuntu-mate-$pkgname-*
  python setup.py install --root="$pkgdir" --optimize=1
  cp -r "$srcdir"/ubuntu-mate-settings/usr/share/mate-panel "$pkgdir/usr/share"
}
