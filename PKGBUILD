# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Slimbook <dev at slimbook dot es>
# Contributor: tioguda <guda.flavio@gmail.com>
pkgname=slimbookbattery
pkgver=4.0.4
pkgrel=1
pkgdesc="Battery optimization application for portable devices."
arch=('x86_64')
url="https://github.com/slimbook/slimbookbattery"
license=('GPL3')
depends=('libnotify'
         'tlp'
         'tlp-rdw'
         'cron'
         'dbus-python'
         'dmidecode'
         'gtk3'
         'libayatana-appindicator'
         'python-gobject'
         'python-pillow'
         'xorg-xdpyinfo')
optdepends=('nvidia-prime: for hybrid graphics switching'
            'slimbookamdcontroller: Synchronize battery mode with CPU TDP mode'
            'slimbookintelcontroller: Synchronize battery mode with CPU TDP mode')
install="$pkgname.install"
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('d8191fa2d7641c4aa55066063f34687ca649bd71a304eedb18a6730a6f3f76fa')

package() {
  bsdtar xf data.tar.xz -C "$pkgdir"

  # Symlink service
  install -d "$pkgdir/usr/lib/systemd/system"
  ln -s "/usr/share/$pkgname/src/service/$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system"

  # Remove duplicate GPL3 license
  rm "$pkgdir/usr/share/doc/$pkgname/copyright"

  # Install locales
  # cd "$pkgdir/usr/share/$pkgname/src/translations"
  # for lang in $(ls -d */); do
  #   install -d "$pkgdir/usr/share/translations/${lang}LC_MESSAGES"
  #   mv "$pkgdir/usr/share/$pkgname/src/translations/${lang}LC_MESSAGES"/*.mo \
  #     "$pkgdir/usr/share/translations/${lang}LC_MESSAGES"
  # done
  # rm -rf "$pkgdir/usr/share/$pkgname/src/translations"
}
