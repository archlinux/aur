# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Slimbook <dev at slimbook dot es>
pkgname=slimbookintelcontroller
pkgver=1.0beta
pkgrel=2
pkgdesc="Application for the performance management of Intel processors"
arch=('any')
url="https://github.com/slimbook/slimbookintelcontroller"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'intel-undervolt'
  'libayatana-appindicator'
  'libnotify'
  'mokutil'
  'pciutils'
  'python-dbus'
  'python-gobject'
  'python-pillow'
  'systemd-libs'
)
install="$pkgname.install"
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('d0d031f4313d6bc5aae420406af8b796610f311171fb2410febf6090876acc57')

package() {
  bsdtar xf data.tar.zst -C "$pkgdir"

  # App permissions
  chmod +x "$pkgdir/usr/lib/systemd/system-sleep/$pkgname"

  # Remove invalid Python 3.8 bytecode
  find "$pkgdir/usr/share/$pkgbase/src/" -type d -name "__pycache__" -prune -exec rm -rf {} \;
}
