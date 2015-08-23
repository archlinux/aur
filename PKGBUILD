# Maintainer: Vyacheslav Konovalov <vyachkonovalov@gmail.com>

pkgname=redis-desktop-manager-bin
pkgver=0.8.0_17
pkgrel=1
pkgdesc='Cross-platform open source Redis DB management tool'
arch=('x86_64')
url="http://redisdesktop.com/"
license=('LGPLv2.1')
depends=('qt5-base' 'qt5-imageformats' 'qt5-tools' 'qt5-declarative' 'qt5-quickcontrols')
conflicts=('redis-desktop-manager')
source=('https://github.com/uglide/RedisDesktopManager/releases/download/0.8.0-rc4/redis-desktop-manager_0.8.0-17_amd64.deb'
        'rdm.desktop' 'qt.conf')
md5sums=('40d028228389fdf990e811aecae9e69b'
         'd82e4a7032dc1769457c3f5722a19259'
         'd4f85174d954124144531fa430e76c29')

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
