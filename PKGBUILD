# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Jekyll Wu, Jacco Koning, qwak, twa022

pkgname=usb-creator
pkgver=0.3.10
pkgrel=2
pkgdesc="Create bootable USB from a LiveCD or disc image of Ubuntu"
arch=('any')
url="https://launchpad.net/usb-creator"
license=('GPL3')
depends=('udisks2' 'syslinux' 'parted' 'dosfstools' 'mtools' 'cdrkit' 'python-dbus'
         'python-gobject')
makedepends=('python-distutils-extra')
optdepends=('python-pyqt5: for KDE/QT5 frontend'
            'gtk3: for GTK frontend')
install=usb-creator.install
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.tar.xz"
        "$pkgname-fix-unity-check.patch")
sha256sums=('583de0edd663cb93ccff679535e4fd868004da4cbef0b84087429a836bb31a4b'
            '93e8892ae7f20589185c65c2b21fbe22b8a945ce388a76c6e93f5a7975350cf8')

#prepare() {
#  patch -Np0 < $pkgname-fix-unity-check.patch
#}

package() {
  cd $pkgname-0.3.10

  python3 setup.py install --root="$pkgdir/" --optimize=1

  # FIXME: install manual pages
  install -d "$pkgdir"/usr/share/man/man8
  install -Dm0644 man/$pkgname-{gtk,kde}.8 "$pkgdir"/usr/share/man/man8
}
