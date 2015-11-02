# Maintainer: Vyacheslav Konovalov <vyachkonovalov@gmail.com>

pkgname=redis-desktop-manager-bin
pkgver=0.8.2_117
pkgrel=1
pkgdesc='Cross-platform open source Redis DB management tool'
arch=('x86_64')
url="http://redisdesktop.com/"
license=('LGPLv2.1')
depends=('qt5-base' 'qt5-imageformats' 'qt5-tools' 'qt5-declarative' 'qt5-quickcontrols')
conflicts=('redis-desktop-manager')
source=('https://github.com/uglide/RedisDesktopManager/releases/download/0.8.2/redis-desktop-manager_0.8.2-117_amd64.deb'
        'rdm.desktop' 'qt.conf')
sha256sums=('c8c7ed67106a7e0354e72611fd04828c6557065e538b99a81bfaadbced5ead1a'
            '4fac85cec4a7abe7254ff3a6f0382d9a6f2b712372ecbd74474a2f8efe9c4e3c'
            'b0b7c82e7d02a9083fbd5950f17f1a9237c9bf51bcd817252202a4f263fa89ff')

prepare() {
  bsdtar xf $srcdir/data.tar.xz
}

package() {
  _origdir=$srcdir/usr/share
  _destdir=$pkgdir/usr/share

  install -Dm755 "${_origdir}/redis-desktop-manager/bin/crashreporter" "${_destdir}/redis-desktop-manager/bin/crashreporter"
  install -Dm755 "${_origdir}/redis-desktop-manager/bin/rdm" "${_destdir}/redis-desktop-manager/bin/rdm"
  install -Dm644 "${_origdir}/doc/redis-desktop-manager/copyright" "${_destdir}/doc/redis-desktop-manager/copyright"
  install -Dm644 "${_origdir}/redis-desktop-manager/bin/rdm.png" "${_destdir}/pixmaps/rdm.png"
  install -Dm644 $srcdir/rdm.desktop "${_destdir}/applications/rdm.desktop"
  install -Dm644 $srcdir/qt.conf "${_destdir}/redis-desktop-manager/bin/qt.conf"

  mkdir $pkgdir/usr/bin
  ln -s /usr/share/redis-desktop-manager/bin/rdm $pkgdir/usr/bin/rdm
}
