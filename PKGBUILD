# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Slimbook <dev at slimbook dot es>
pkgname=slimbookamdcontroller
pkgver=0.4beta
pkgrel=2
pkgdesc="Application for the performance management of AMD processors"
arch=('any')
url="https://github.com/Slimbook-Team/slimbookamdcontroller"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'libayatana-appindicator'
  'libnotify'
  'mokutil'
  'python-dbus'
  'python-gobject'
  'python-matplotlib'
  'python-numpy'
  'python-pillow'
  'python-pyamdgpuinfo'
  'ryzenadj'
  'systemd-libs'
)
install="$pkgname.install"
source=("$url/releases/download/v$pkgver/${pkgname}_${pkgver}_all.deb")
#source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('47440908028b77a3d8502f3e0466d203bfe78a39d0e87d44d098b8e8a262c5c8')

package() {
  bsdtar xf data.tar.xz -C "$pkgdir"

  ln -s /usr/bin/ryzenadj "$pkgdir/usr/share/$pkgname/"

  # App permissions
  chmod +x "$pkgdir/usr/lib/systemd/system-sleep/$pkgname"
  chmod -R 755 "$pkgdir/usr/share/$pkgname/src/"

  # Remove invalid Python 3.8 bytecode
  find "$pkgdir/usr/share/$pkgbase/src/" -type d -name "__pycache__" -prune -exec rm -rf {} \;
}
