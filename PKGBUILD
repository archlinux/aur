# Maintainer: Robin Lange <robin dot langenc at gmail dot com>
# Contributor: Robin Lange <robin dot langenc at gmail dot com>
pkgname=optimus-manager
pkgver=0.1
pkgrel=1
pkgdesc="Management utility to handle GPU switching for Optimus laptops."
arch=(any)
url="https://github.com/Askannz/optimus-manager"
license=(MIT)
depends=('python3' 'bbswitch')
makedepends=('python-setuptools')
source=("optimus-manager::git+https://github.com/Askannz/optimus-manager.git#branch=master")
sha256sums=('SKIP')

package() {

  cd "${srcdir}/optimus-manager/"
  
  mkdir -p $pkgdir/etc/modprobe.d/
  cp modules/optimus-manager.conf $pkgdir/etc/modprobe.d/
  
  mkdir -p $pkgdir/usr/bin/
  cp xorg/optimus-manager_Xsetup $pkgdir/usr/bin/
  chmod +x $pkgdir/usr/bin/optimus-manager_Xsetup
  
  mkdir -p $pkgdir/etc/systemd/system/
  cp systemd/optimus-manager.service $pkgdir/etc/systemd/system/
  
  mkdir -p $pkgdir/usr/share/
  cp optimus-manager.conf $pkgdir/usr/share/
  
  mkdir -p $pkgdir/var/lib/optimus-manager/
  cp var/startup_mode $pkgdir/var/lib/optimus-manager/
  
  python setup.py install --root="$pkgdir/"
}

