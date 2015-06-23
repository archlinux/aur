# Contributor: Yarema aka Knedlyk <yupadmin@gmail.com>

pkgname=radiotray
pkgver=0.7.3
pkgrel=7
commit=1717a0e8c143
pkgdesc="An online radio streaming player that runs on a Linux system tray."
arch=(any)
url="http://radiotray.wordpress.com/"
license=(GPL)
depends=('gstreamer0.10-base-plugins' 'gstreamer0.10-python' 'pygtk' \
'python2-notify' 'python2-xdg' 'python2-dbus' 'gstreamer0.10-good-plugins' \
'python2-gobject' 'python2-lxml' 'libappindicator-gtk2')
optdepends=('gstreamer0.10-bad-plugins' 'gstreamer0.10-ugly-plugins' 'gstreamer0.10-ffmpeg') 
makedepends=(python2)
provides=(radiotray)
source=(https://bitbucket.org/carlmig/radio-tray/get/${pkgname}-${pkgver}.tar.gz
	encoding.patch
	gtk.patch)
conflicts=(radiotray-hg)
package() {
    cd $srcdir/carlmig-radio-tray-$commit
    patch -p1 < $srcdir/encoding.patch	|| return 1
    patch -p1 < $srcdir/gtk.patch	|| return 1
    mkdir $pkgdir/usr
    python2 setup.py install --root=${pkgdir}/ --optimize=1 || return 1
    chmod +x $pkgdir/usr/bin/radiotray || return 1
}
md5sums=('33d30ba8d2a293382f60990b761d1d38'
         '3f3fe97dfe4fef65af8345d24fd19a2e'
         '0ef80483af7a7a627e5d1dbef978d6fc')
