# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Slimbook <dev at slimbook dot es>
# Contributor: tioguda <guda.flavio@gmail.com>
pkgname=slimbookbattery
pkgver=4.0.9beta
pkgrel=1
pkgdesc="Battery optimization application for portable devices."
arch=('x86_64')
url="https://github.com/slimbook/slimbookbattery"
license=('GPL-3.0-or-later')
depends=('cron' 'dbus-python' 'dmidecode' 'gtk3' 'libayatana-appindicator'
         'libnotify' 'polkit' 'python-gobject' 'python-pillow' 'python-setuptools'
         'tlp' 'tlp-rdw' 'vte3' 'xorg-xdpyinfo')
optdepends=('nvidia-prime: for hybrid graphics switching'
            'slimbookamdcontroller: Synchronize battery mode with CPU TDP mode'
            'slimbookintelcontroller: Synchronize battery mode with CPU TDP mode')
install="$pkgname.install"
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('7b585c1d0ca4f4c02750245a487067d8eeebbb52bd5315d38a87fd07e57f1b38')

package() {
  bsdtar xf data.tar.xz -C "$pkgdir"

  chmod -R 755 "$pkgdir"/usr/share/slimbookbattery/src/*.py

  # Symlink service
  install -d "$pkgdir/usr/lib/systemd/system"
  ln -s "/usr/share/$pkgname/src/service/$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system/"
}
