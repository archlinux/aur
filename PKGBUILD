# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=lightdm-settings
pkgver=1.2.2
pkgrel=1
pkgdesc="A configuration tool for the LightDM display manager"
_add_group=add-autologin-group
arch=('any')
url="https://github.com/linuxmint/${pkgname}"
license=('GPL3')
depends=('hicolor-icon-theme'
    'lightdm-slick-greeter'
    'polkit'
    'python-gobject'
    'python-setproctitle'
    'python-xapp')
makedepends=('desktop-file-utils' 
    'gettext')
install=$_add_group.install
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz"
    "$_add_group.script"
    "$_add_group.service")
sha256sums=('ca558b6733baeb55e614e16c3995edaa8d3a0e9afa08794a0c09830a44495d21'
            '475bb4805a419aca106f9f42bcb837c7dc53eeb84b5c50d8ee8d892b55d6c2b4'
            'a356ee9dc1e876d73c49ab30fdc6417edb7a817639122fff7fe0ebff72e33190')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  cp -r usr $pkgdir

#install systemd service
  cd /$srcdir
  install -Dm755 $_add_group.script $pkgdir/usr/bin/$_add_group
  install -Dm644 $_add_group.service $pkgdir/etc/systemd/system/$_add_group.service
}
