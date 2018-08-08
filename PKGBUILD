# Maintainer: Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=pyakm
pkgver=0.0.2
pkgrel=3
pkgdesc="Simple GUI to manage arch linux kernels"
arch=('x86_64')
url="https://github.com/pssncp142/pyakm"
license=('GPL3')
depends=('python-dbus' 'python-gobject' 'python-beautifulsoup4' 'python-requests' 'pyalpm')
provides=('pyakm')
source=("pyakm-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=("dca0f6a3f18330be655c5e391add16e35164171a21e29756770ac3a65f2e6a23")

prepare(){
   cd "$srcdir/pyakm-$pkgver"
}

package(){
   cd "$srcdir/pyakm-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
   install -D -m644 data/grub/01_pyakm_template "$pkgdir"/usr/share/pyakm/data/grub/01_pyakm_template 
   install -D -m644 data/ui/manager.ui "$pkgdir"/usr/share/pyakm/ui/manager.ui 
   install -D -m644 data/dbus/com.github.pyakm.system.conf "$pkgdir"/etc/dbus-1/system.d/com.github.pyakm.system.conf
   install -D -m644 data/dbus/com.github.pyakm.system.service "$pkgdir"/usr/share/dbus-1/system-services/com.github.pyakm.system.service
   install -D -m644 data/polkit/com.github.pyakm.policy "$pkgdir"/usr/share/polkit-1/actions/com.github.pyakm.policy
   install -D -m644 data/systemd/pyakm-system.service "$pkgdir"/usr/lib/systemd/system/pyakm-system.service
   install -D -m644 data/desktop/pyakm.desktop "$pkgdir"/usr/share/applications/pyakm.desktop
   install -D -m644 data/desktop/pyakm.png "$pkgdir"/usr/share/pixmaps/pyakm.png
   install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/pyakm/LICENSE   
}
