# Maintainer: Jonathon Fernyhough <jonathon manjaro_dot_org>
# Contributor: twa022 <twa022 at gmail dot com>
# Contributor: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-tweak
pkgver=18.10.2
_umsver=18.04.17
pkgrel=1
pkgdesc="Tweak tool for MATE (fork of MintDesktop)"
arch=('any')
url="https://github.com/ubuntu-mate/mate-tweak"
license=('GPL')
depends=('gtk3' 'libnotify' 'mate-applets' 'python-configobj' 'python-gobject' 'python-psutil' 'python-setproctitle')
makedepends=('python-distutils-extra' 'python-setuptools')
optdepends=('brisk-menu: for Manjaro panel layout'
            'mate-applet-dock: for Mutiny panel layout'
            'mate-menu: to enable advanced menu'
            'mate-netbook: for Netbook panel layout'
            'plank: for Cupertino panel layout'
            'synapse: to enable launcher'
            'tilda: to enable pull-down terminal'
            'topmenu-gtk: for Mutiny panel layout'
            'vala-panel-appmenu-mate: for Mutiny,Cupertino')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ubuntu-mate/$pkgname/archive/$pkgver.tar.gz"
        "ubuntu-mate-settings-$_umsver.tar.gz::https://github.com/ubuntu-mate/ubuntu-mate-settings/archive/$_umsver.tar.gz")
sha256sums=('1e5eea75339c1e45f3d643f7c0750fac1e1814958b1dd3f846f7a49faf1fabfb'
            'e9eb6b763d1edb2f9804e47248bf447248d3054b7291b161db6e25f09f7e482c')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's|/usr/lib/mate-applets/topmenu-mate-panel-applet|/usr/lib/topmenu-gtk/topmenu-mate-panel-applet|' mate-tweak
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  cp -r "$srcdir"/ubuntu-mate-settings-$_umsver/usr/share/mate-panel "$pkgdir/usr/share"
}
