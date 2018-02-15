# Maintainer: Jonathon Fernyhough <jonathon manjaro_dot_org>
# Contributor: twa022 <twa022 at gmail dot com>
# Contributor: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-tweak
pkgver=18.04.10
_umsver=18.04.7
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
        #"ubuntu-mate-settings-$_umsver.tar.gz::https://github.com/ubuntu-mate/ubuntu-mate-settings/archive/$_umsver.tar.gz"
        "ubuntu-mate-settings-$_umsver.tar.gz::https://launchpad.net/ubuntu/+archive/primary/+files/ubuntu-mate-settings_$_umsver.tar.xz")
sha256sums=('a1e9873094011093dbe48f2c997ab078c5586305f58e761e48c7c72df1dae59c'
            '1cd12b2c32592ca72a6584d9b74ff98d8256c08c40957c2fb7f15db295c6bc8c')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's|/usr/lib/mate-applets/topmenu-mate-panel-applet|/usr/lib/topmenu-gtk/topmenu-mate-panel-applet|' mate-tweak
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  #cp -r "$srcdir"/ubuntu-mate-settings-$_umsver/usr/share/mate-panel "$pkgdir/usr/share"
  cp -r "$srcdir"/ubuntu-mate-settings/usr/share/mate-panel "$pkgdir/usr/share"
}
