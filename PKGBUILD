# Maintainer: Jan Magnus Brevik <janmbrevik at gmail dot com>
# Contributor: Rubén Fdes Moreira <tmp-meteque@openmailbox.com>
# Contributor: Sigmund Vestergaard <sigmundv at gmail dot com>
# Contributor: MacCyber <jonas.enge at gmail dot com>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Antti Hautaniemi <an7oine at me com>

pkgname=acestream-engine
pkgver=3.1.16
pkgrel=1
_ubuntuver=16.04
pkgdesc="ACE Stream engine"
arch=('x86_64')
url="http://acestream.org/"
license=('unknown')
depends=('python2-setuptools' 'python2-xlib' 'python2-m2crypto' 'python2-apsw')
optdepends=('libappindicator-gtk2: GTK+ gui support')
install='acestream-engine.install'

source=("acestream-engine.service"
        "http://dl.acestream.org/linux/acestream_${pkgver}_ubuntu_${_ubuntuver}_x86_64.tar.gz")
sha256sums=('b9863a9dd3ee6d41d18475f5f539107fe81a573f45ca1cb98013441f955f1af0'
            '452bccb8ae8b5ff4497bbb796081dcf3fec2b699ba9ce704107556a3d6ad2ad7')

package() {
  cd "$srcdir/acestream_${pkgver}_ubuntu_${_ubuntuver}_$CARCH"
  install -Dm755 acestreamengine "$pkgdir/opt/acestream/acestreamengine"
  sed -i "/ROOT=/c\ROOT=\/opt\/acestream" "start-engine"
  install -Dm755 "start-engine" "$pkgdir/opt/acestream/start-engine"
  cp -a acestream.conf "$pkgdir/opt/acestream/acestream.conf"
  cp -a data lib "$pkgdir/opt/acestream/"
  install -Dm644 "$srcdir/acestream-engine.service" "$pkgdir/usr/lib/systemd/system/acestream-engine.service"
}
