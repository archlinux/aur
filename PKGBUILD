# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Slimbook <dev at slimbook dot es>
# Contributor: tioguda <guda.flavio@gmail.com>
pkgname=slimbookbattery
pkgver=4.0.8beta
pkgrel=1
pkgdesc="Battery optimization application for portable devices."
arch=('x86_64')
url="https://github.com/slimbook/slimbookbattery"
license=('GPL3')
depends=('cron' 'dbus-python' 'dmidecode' 'gtk3' 'libayatana-appindicator'
         'libnotify' 'python-gobject' 'python-pillow' 'tlp' 'tlp-rdw' 'vte3'
         'xorg-xdpyinfo')
optdepends=('nvidia-prime: for hybrid graphics switching'
            'slimbookamdcontroller: Synchronize battery mode with CPU TDP mode'
            'slimbookintelcontroller: Synchronize battery mode with CPU TDP mode')
install="$pkgname.install"
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('ace329a4afa05998f143e7f31f5f94aaa0437177d001379e37a5482192ad668a')

package() {
  bsdtar xf data.tar.xz -C "$pkgdir"

  chmod -R 755 "$pkgdir"/usr/share/slimbookbattery/src/*.py

  # Symlink service
  install -d "$pkgdir/usr/lib/systemd/system"
  ln -s "/usr/share/$pkgname/src/service/$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system/"
}
